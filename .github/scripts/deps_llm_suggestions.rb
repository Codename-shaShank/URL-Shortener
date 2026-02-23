#!/usr/bin/env ruby
# frozen_string_literal: true

require "json"
require "net/http"
require "uri"

GEMINI_API_KEY = ENV["GEMINI_API_KEY"]
MODEL = "gemini-1.5-flash-latest" 

if GEMINI_API_KEY.nil? || GEMINI_API_KEY.empty?
  warn "GEMINI_API_KEY is not set"
  exit 1
end

def call_gemini(prompt)
  uri = URI("https://generativelanguage.googleapis.com/v1/models/#{MODEL}:generateContent?key=#{GEMINI_API_KEY}")

  body = {
    contents: [
      {
        parts: [
          { text: prompt }
        ]
      }
    ]
  }

  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true

  req = Net::HTTP::Post.new(uri.request_uri, "Content-Type" => "application/json")
  req.body = JSON.dump(body)

  res = http.request(req)
  unless res.is_a?(Net::HTTPSuccess)
    warn "Gemini API error: #{res.code} #{res.body}"
    exit 1
  end

  data = JSON.parse(res.body)
  text = data.dig("candidates", 0, "content", "parts", 0, "text")
  text || ""
end

gem_review   = File.exist?("gem_review.md")   ? File.read("gem_review.md")   : ""
deps_usages  = File.exist?("deps_usages.md")  ? File.read("deps_usages.md")  : ""

prompt = <<~PROMPT
You are helping update a small Ruby/Rails app after dependency upgrades.

Here is a summary of the gem changes and risk:

#{gem_review}

Here are the code locations where the upgraded gems are used:

#{deps_usages}

Task:

For each upgraded gem:

1. Identify likely code changes needed to keep existing behavior working with the new version.
2. Focus on version-specific changes (new APIs, callbacks, controller changes, configs, etc).
3. For each change, provide:
   - BEFORE and AFTER Ruby code snippets (short, focused).
   - An inline Ruby comment explaining what changed and why.
   - A short bullet that could go into docs/dependency-upgrades-changelog.md.

Output format:

- Use Markdown.
- Group by gem name (## gem_name).
- Under each gem, list concrete suggestions with code blocks.

Do NOT try to run tests; just propose changes.
PROMPT

puts "Calling Gemini for suggestions..."
suggestions = call_gemini(prompt)

File.write("gemini_suggestions.md", suggestions)
puts "Wrote LLM suggestions to gemini_suggestions.md"
