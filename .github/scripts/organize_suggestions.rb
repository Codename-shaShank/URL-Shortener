#!/usr/bin/env ruby
# frozen_string_literal: true
# Helper script to parse and organize Gemini suggestions for manual implementation

require "json"
require "fileutils"
require "time"

SUGGESTIONS_FILE = "gemini_suggestions.md"
OUTPUT_DIR = ".github/gem_suggestions"

# Create output directory
FileUtils.mkdir_p(OUTPUT_DIR)

unless File.exist?(SUGGESTIONS_FILE)
  puts "❌ #{SUGGESTIONS_FILE} not found"
  puts "Run the workflow first to generate suggestions."
  exit 1
end

content = File.read(SUGGESTIONS_FILE)

# Parse gems from heading level 2
gems = content.scan(/^## ([^\n]+)/).flatten

puts "📋 Found suggestions for #{gems.size} gem(s):"
puts

# Helper to sanitize filename
def sanitize_filename(name)
  # Remove or replace invalid filename characters
  sanitized = name.downcase
                  .gsub(/[*:\/\\|?"<>]/, '')  # Remove invalid chars
                  .gsub(/[&,]/, '_')           # Replace separators with underscore
                  .gsub(/\s+/, '_')            # Replace spaces with underscore
                  .gsub(/_+/, '_')             # Collapse multiple underscores
                  .gsub(/^_|_$/, '')           # Remove leading/trailing underscores
  
  # Truncate if too long (max 200 chars for filename)
  if sanitized.length > 200
    sanitized = sanitized[0..196] + "_etc"
  end
  
  sanitized
end

gems.each do |gem|
  # Extract content for this gem
  gem_pattern = /^## #{Regexp.escape(gem)}\n\n(.*?)(?=^##|$)/m
  gem_content = content.match(gem_pattern)&.captures&.first || ""

  # Save to individual file for easy reference - sanitize filename
  safe_filename = sanitize_filename(gem)
  file_path = File.join(OUTPUT_DIR, "#{safe_filename}.md")
  File.write(file_path, "# #{gem} Upgrade Suggestions\n\n#{gem_content}")

  # Extract code blocks to show number of changes
  code_blocks = gem_content.scan(/```\w+/).count / 2  # before/after pairs
  puts "  ✓ #{gem}"
  puts "    - #{code_blocks} code change(s) suggested"
  puts "    - Details saved to: #{file_path}"
end

puts
puts "💡 All suggestions organized in: #{OUTPUT_DIR}/"
puts "   Review each file and apply changes manually."
puts
puts "📋 Process:"
puts "   1. Read suggestion files in #{OUTPUT_DIR}/"
puts "   2. For each suggested change:"
puts "      a. Review the BEFORE/AFTER code"
puts "      b. Apply change to corresponding file"
puts "      c. Test the change"
puts "   3. Commit changes with reference to PR"

# Create a summary file
summary = {
  generated_at: Time.now.iso8601,
  total_gems: gems.size,
  gems: gems,
  suggestions_file: SUGGESTIONS_FILE,
  output_directory: OUTPUT_DIR,
  instructions: "Review each .md file in output_directory and apply changes manually"
}

summary_path = File.join(OUTPUT_DIR, "summary.json")
File.write(summary_path, JSON.pretty_generate(summary))
puts "   Summary saved to: #{summary_path}"
