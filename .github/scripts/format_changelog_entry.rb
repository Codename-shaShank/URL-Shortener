#!/usr/bin/env ruby
# frozen_string_literal: true
# TODO(deps): Review usages of 'date' in this file for version-specific changes.
# Formats Gemini suggestions into a changelog entry and updates docs

require "time"
require "json"
require "fileutils"

CHANGELOG_PATH = ENV["CHANGELOG_PATH"] || "docs/dependency-upgrades-changelog.md"
GEMINI_SUGGESTIONS_PATH = "gemini_suggestions.md"
GEM_REVIEW_PATH = ENV["GEM_REVIEW_PATH"] || "gem_review.md"

# Ensure docs directory exists
FileUtils.mkdir_p(File.dirname(CHANGELOG_PATH))

# Read gem review to get version info
gem_review = File.exist?(GEM_REVIEW_PATH) ? File.read(GEM_REVIEW_PATH) : ""

# Read Gemini suggestions
suggestions = File.exist?(GEMINI_SUGGESTIONS_PATH) ? File.read(GEMINI_SUGGESTIONS_PATH) : ""

if suggestions.strip.empty?
  puts "No Gemini suggestions found, skipping changelog update."
  exit 0
end

# Extract gem changes from reviewed gems
gems_changed = []
gem_review.each_line do |line|
  if line.start_with?("| `")
    if line =~ /\|\s*`([^`]+)`\s*\|\s*(.+?)\s*\|\s*(.+?)\s*\|/
      gem_name = Regexp.last_match(1)
      old_version = Regexp.last_match(2).strip
      new_version = Regexp.last_match(3).strip
      gems_changed << "#{gem_name} (#{old_version} → #{new_version})"
    end
  end
end

timestamp = Time.now.strftime("%Y-%m-%d %H:%M:%S")

# Create changelog entry
changelog_entry = <<~ENTRY
## [Unreleased] - #{timestamp}

### Dependencies Updated
#{gems_changed.map { |g| "- #{g}" }.join("\n")}

### Changes and Updates

#{suggestions}

---

ENTRY

# Read existing changelog or create new one
changelog_content = if File.exist?(CHANGELOG_PATH)
                       File.read(CHANGELOG_PATH)
                     else
                       "# Dependency Upgrades Changelog\n\n"
                     end

# Prepend new entry
new_content = changelog_content.sub(
  /^(# Dependency Upgrades Changelog\n\n)/,
  "\\1#{changelog_entry}"
)

File.write(CHANGELOG_PATH, new_content)

puts "Updated changelog at: #{CHANGELOG_PATH}"
puts "Added entry for #{gems_changed.size} gem(s)."

# Also create a summary for the commit
summary = {
  gems_updated: gems_changed,
  timestamp: timestamp,
  changelog_path: CHANGELOG_PATH
}

File.write(".github/.changelog-summary.json", JSON.pretty_generate(summary))
puts "Changelog summary saved."
