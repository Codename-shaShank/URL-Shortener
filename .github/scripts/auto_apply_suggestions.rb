#!/usr/bin/env ruby
# frozen_string_literal: true
# Auto-apply code suggestions from Gemini to actual source files

require "fileutils"

SUGGESTIONS_FILE = "gemini_suggestions.md"
USAGES_FILE = "deps_usages.md"

unless File.exist?(SUGGESTIONS_FILE)
  puts "⚠️  No #{SUGGESTIONS_FILE} found. Skipping auto-apply."
  exit 0
end

suggestions_content = File.read(SUGGESTIONS_FILE)

# Parse code change suggestions
# Looking for patterns like:
# **BEFORE:**
# ```ruby
# old code
# ```
# **AFTER:**
# ```ruby
# new code
# ```

class CodeChange
  attr_accessor :gem_name, :before_code, :after_code, :description

  def initialize(gem_name)
    @gem_name = gem_name
    @before_code = nil
    @after_code = nil
    @description = ""
  end
end

changes = []
current_gem = nil
current_change = nil
in_before = false
in_after = false
code_buffer = []

suggestions_content.each_line do |line|
  # Detect gem sections (## gem_name)
  if line.start_with?("## ")
    current_gem = line.sub(/^## /, "").strip
    next
  end

  # Detect BEFORE block
  if line.match?(/\*\*BEFORE:?\*\*/i)
    if current_change
      changes << current_change
    end
    current_change = CodeChange.new(current_gem)
    in_before = false
    in_after = false
    next
  end

  # Detect AFTER block
  if line.match?(/\*\*AFTER:?\*\*/i)
    in_before = false
    in_after = false
    next
  end

  # Detect code block start
  if line.start_with?("```")
    lang = line.strip.sub(/^```/, "")
    
    if in_before == :waiting
      # Start capturing BEFORE code
      in_before = true
      code_buffer = []
    elsif in_before == true && !lang.empty?
      # End of BEFORE code block
      current_change.before_code = code_buffer.join if current_change
      code_buffer = []
      in_before = :waiting_after
    elsif in_before == :waiting_after
      # This is the AFTER code block
      in_after = true
      code_buffer = []
    elsif in_after == true && !lang.empty?
      # End of AFTER code block
      current_change.after_code = code_buffer.join if current_change
      code_buffer = []
      in_after = false
      changes << current_change if current_change
      current_change = nil
    end
    next
  end

  # Better pattern: look for consecutive code blocks after BEFORE/AFTER markers
  if line.strip.start_with?("```ruby") || line.strip.start_with?("```rb")
    if code_buffer.empty?
      # Starting a code block
      code_buffer = []
      in_before = true if current_change && !current_change.before_code
      in_after = true if current_change && current_change.before_code && !current_change.after_code
    end
    next
  end

  # End of code block
  if line.strip == "```" && !code_buffer.empty?
    if in_before && current_change && !current_change.before_code
      current_change.before_code = code_buffer.join("\n")
      code_buffer = []
      in_before = false
    elsif in_after && current_change && !current_change.after_code
      current_change.after_code = code_buffer.join("\n")
      code_buffer = []
      in_after = false
      changes << current_change
      current_change = nil
    end
    next
  end

  # Capture code lines
  if in_before || in_after
    code_buffer << line.rstrip
  end
end

# Add last change if exists
changes << current_change if current_change && current_change.before_code && current_change.after_code

# Simple alternative parser - look for consecutive ruby code blocks
def extract_changes_simple(content)
  changes = []
  current_gem = nil
  
  # Split by gem sections
  sections = content.split(/^## /)
  
  sections.each do |section|
    next if section.strip.empty?
    
    lines = section.lines
    gem_name = lines.first&.strip
    next unless gem_name
    
    # Find all ruby code blocks
    code_blocks = []
    in_block = false
    current_block = []
    
    lines.each do |line|
      if line.strip.match?(/^```(ruby|rb)/)
        in_block = true
        current_block = []
      elsif line.strip == "```" && in_block
        code_blocks << current_block.join("\n")
        current_block = []
        in_block = false
      elsif in_block
        current_block << line.rstrip
      end
    end
    
    # Pair consecutive blocks as BEFORE/AFTER
    code_blocks.each_slice(2) do |before, after|
      if before && after
        change = CodeChange.new(gem_name)
        change.before_code = before
        change.after_code = after
        changes << change
      end
    end
  end
  
  changes
end

# Use simple parser
changes = extract_changes_simple(suggestions_content)

if changes.empty?
  puts "ℹ️  No code changes found in suggestions (no BEFORE/AFTER pairs)"
  exit 0
end

puts "📝 Found #{changes.size} code change(s) to apply"
puts

# Get list of Ruby files to search
def ruby_files(root = ".")
  Dir.glob(File.join(root, "**", "*.rb")).reject do |f|
    f.include?("vendor/") || f.include?("node_modules/") || f.include?(".git/")
  end
end

files = ruby_files(".")
applied_changes = []
failed_changes = []

changes.each_with_index do |change, idx|
  puts "🔍 Change #{idx + 1}/#{changes.size} (#{change.gem_name})"
  
  before = change.before_code.strip
  after = change.after_code.strip
  
  if before.empty? || after.empty?
    puts "   ⚠️  Skipped: Empty before or after code"
    failed_changes << { change: change, reason: "Empty code block" }
    next
  end
  
  # Search for matching code in files
  found = false
  
  files.each do |file_path|
    content = File.read(file_path)
    
    # Try exact match first
    if content.include?(before)
      # Replace the code
      new_content = content.sub(before, after)
      
      if new_content != content
        File.write(file_path, new_content)
        puts "   ✅ Applied to: #{file_path}"
        applied_changes << { change: change, file: file_path }
        found = true
        break
      end
    end
  end
  
  unless found
    # Try fuzzy match (ignoring leading/trailing whitespace per line)
    before_lines = before.lines.map(&:strip)
    
    files.each do |file_path|
      content = File.read(file_path)
      content_lines = content.lines
      
      # Look for matching sequence
      content_lines.each_cons(before_lines.size).with_index do |window, start_idx|
        if window.map(&:strip) == before_lines
          # Found a match! Replace it
          end_idx = start_idx + before_lines.size - 1
          
          # Replace the lines
          new_lines = content_lines.dup
          new_lines[start_idx..end_idx] = after + "\n"
          
          File.write(file_path, new_lines.join)
          puts "   ✅ Applied to: #{file_path} (fuzzy match)"
          applied_changes << { change: change, file: file_path }
          found = true
          break
        end
      end
      
      break if found
    end
  end
  
  unless found
    puts "   ❌ Could not find matching code in any file"
    failed_changes << { change: change, reason: "No matching code found" }
  end
end

puts
puts "=" * 50
puts "📊 Summary:"
puts "   ✅ Applied: #{applied_changes.size}"
puts "   ❌ Failed: #{failed_changes.size}"
puts

if applied_changes.any?
  puts "✅ Successfully applied changes to:"
  applied_changes.each do |item|
    puts "   - #{item[:file]} (#{item[:change].gem_name})"
  end
  puts
end

if failed_changes.any?
  puts "⚠️  Failed to apply:"
  failed_changes.each do |item|
    puts "   - #{item[:change].gem_name}: #{item[:reason]}"
  end
  puts
  puts "💡 These changes may need manual review."
end

puts
puts "✨ Auto-apply complete!"
