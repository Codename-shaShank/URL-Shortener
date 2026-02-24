## Dependency Usages

This document lists where changed gems are referenced in the codebase.

### rake

**File:** `.github/scripts/deps_find_usages.rb`

| Line | Code |
|------|------|
| 3 | `# TODO(deps): Review usages of 'rake' in this file for version-specific changes.` |
| 37 | `exts = [".rb", ".rake", ".ru"]` |

### date

**File:** `.github/scripts/deps_find_usages.rb`

| Line | Code |
|------|------|
| 35 | `# 2. Find candidate files where we might use these gems` |

**File:** `.github/scripts/deps_llm_suggestions.rb`

| Line | Code |
|------|------|
| 43 | `text = data.dig("candidates", 0, "content", "parts", 0, "text")` |
| 61 | `You are helping update a small Ruby/Rails app after dependency upgrades.` |

**File:** `.github/scripts/format_changelog_entry.rb`

| Line | Code |
|------|------|
| 3 | `# Formats Gemini suggestions into a changelog entry and updates docs` |
| 23 | `puts "No Gemini suggestions found, skipping changelog update."` |
| 46 | `### Dependencies Updated` |
| 49 | `### Changes and Updates` |
| 72 | `puts "Updated changelog at: #{CHANGELOG_PATH}"` |
| 77 | `gems_updated: gems_changed,` |

**File:** `.github/scripts/gem_diff.rb`

| Line | Code |
|------|------|
| 139 | `markdown << "This PR updates the resolved gem set based on changes in \`Gemfile\` / \`Gemfile.lock\` ` |
| 162 | `markdown << "   - ⏳ Generate LLM-powered suggestions for code updates\n"` |
| 163 | `markdown << "   - ⏳ Update \`docs/dependency-upgrades-changelog.md\` with upgrade guide\n"` |
| 171 | `markdown << "   - Update or add code to keep existing behavior working for current versions.\n"` |
| 173 | `markdown << "     - Implement the necessary code updates.\n"` |
| 177 | `markdown << "2. **Changelog and docs updates**:\n"` |
| 178 | `markdown << "   - Update or create \`docs/dependency-upgrades-changelog.md\` (or similar) describing:` |
| 180 | `markdown << "     - What code paths or features were updated.\n"` |

**File:** `app/controllers/links_controller.rb`

| Line | Code |
|------|------|
| 2 | `before_action :authenticate_user!, only: [:edit, :update, :destroy]` |
| 3 | `before_action :set_link, only: [:show, :edit, :update, :destroy]` |
| 4 | `before_action :allow_editing_link, only: [:edit, :update, :destroy]` |
| 35 | `def update` |
| 36 | `if @link.update(link_params)` |

**File:** `app/jobs/metadata_job.rb`

| Line | Code |
|------|------|
| 4 | `link.update Metadata.retrieve_from(link.url).attributes` |

**File:** `app/models/link.rb`

| Line | Code |
|------|------|
| 5 | `validates :url, presence: true` |

**File:** `config/initializers/devise.rb`

| Line | Code |
|------|------|
| 183 | `# Invalidates all the remember me tokens when the user signs out.` |
| 197 | `# Email regex used to validate email formats. It simply asserts that` |

**File:** `config/initializers/permissions_policy.rb`

| Line | Code |
|------|------|
| 2 | `# information see https://developers.google.com/web/updates/2018/06/feature-policy` |

**File:** `db/migrate/20240327111611_devise_create_users.rb`

| Line | Code |
|------|------|
| 12 | `t.datetime :reset_password_sent_at` |
| 15 | `t.datetime :remember_created_at` |
| 19 | `# t.datetime :current_sign_in_at` |
| 20 | `# t.datetime :last_sign_in_at` |
| 26 | `# t.datetime :confirmed_at` |
| 27 | `# t.datetime :confirmation_sent_at` |
| 33 | `# t.datetime :locked_at` |

**File:** `db/schema.rb`

| Line | Code |
|------|------|
| 20 | `t.datetime "created_at", null: false` |
| 21 | `t.datetime "updated_at", null: false` |
| 30 | `t.datetime "reset_password_sent_at"` |
| 31 | `t.datetime "remember_created_at"` |
| 32 | `t.datetime "created_at", null: false` |
| 33 | `t.datetime "updated_at", null: false` |
| 42 | `t.datetime "created_at", null: false` |
| 43 | `t.datetime "updated_at", null: false` |

### mail

**File:** `app/mailers/application_mailer.rb`

| Line | Code |
|------|------|
| 3 | `layout "mailer"` |

**File:** `config/environments/development.rb`

| Line | Code |
|------|------|
| 39 | `# Don't care if the mailer can't send.` |
| 40 | `config.action_mailer.raise_delivery_errors = false` |
| 42 | `config.action_mailer.perform_caching = false` |
| 71 | `config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }` |

**File:** `config/environments/production.rb`

| Line | Code |
|------|------|
| 65 | `config.action_mailer.perform_caching = false` |
| 67 | `# Ignore bad email addresses and do not raise email delivery errors.` |
| 68 | `# Set this to true and configure the email server for immediate delivery to raise delivery errors.` |
| 69 | `# config.action_mailer.raise_delivery_errors = false` |

**File:** `config/environments/test.rb`

| Line | Code |
|------|------|
| 39 | `config.action_mailer.perform_caching = false` |
| 41 | `# Tell Action Mailer not to deliver emails to the real world.` |
| 42 | `# The :test delivery method accumulates sent emails in the` |
| 44 | `config.action_mailer.delivery_method = :test` |

**File:** `config/initializers/devise.rb`

| Line | Code |
|------|------|
| 23 | `# Use this hook to configure devise mailer, warden hooks and so forth.` |
| 38 | `# Configure the e-mail address which will be shown in Devise::Mailer,` |
| 39 | `# note that it will be overwritten if you use your own mailer class` |
| 41 | `config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'` |
| 43 | `# Configure the class responsible to send e-mails.` |
| 44 | `# config.mailer = 'Devise::Mailer'` |
| 46 | `# Configure the parent class responsible to send e-mails.` |
| 47 | `# config.parent_mailer = 'ActionMailer::Base'` |
| 57 | `# just :email. You can configure it to use [:username, :subdomain], so for` |
| 63 | `# config.authentication_keys = [:email]` |
| 74 | `# to authenticate or find a user. Default is :email.` |
| 75 | `config.case_insensitive_keys = [:email]` |
| 79 | `# modifying a user and when used to authenticate or find a user. Default is :email.` |
| 80 | `config.strip_whitespace_keys = [:email]` |
| 85 | `# enable it only for database (email + password) authentication.` |
| 105 | `# to behave the same regardless if the e-mail provided was right or wrong.` |
| 145 | `# Send a notification to the original email when the user's email is changed.` |
| 146 | `# config.send_email_changed_notification = false` |
| 148 | `# Send a notification email when the user's password is changed.` |
| 164 | `# their account within 3 days after the mail was sent, but on the fourth day` |
| 170 | `# If true, requires any email changes to be confirmed (exactly the same way as` |
| 171 | `# initial account confirmation) to be applied. Requires additional unconfirmed_email` |
| 172 | `# db field (see migrations). Until confirmed, new email is stored in` |
| 173 | `# unconfirmed_email column, and copied to email column on successful confirmation.` |
| 177 | `# config.confirmation_keys = [:email]` |
| 197 | `# Email regex used to validate email formats. It simply asserts that` |
| 199 | `# to give user feedback and not to assert the e-mail validity.` |
| 200 | `config.email_regexp = /\A[^@\s]+@[^@\s]+\z/` |
| 214 | `# config.unlock_keys = [:email]` |
| 217 | `# :email = Sends an unlock link to the user email` |
| 236 | `# config.reset_password_keys = [:email]` |

**File:** `db/migrate/20240327111611_devise_create_users.rb`

| Line | Code |
|------|------|
| 7 | `t.string :email,              null: false, default: ""` |
| 28 | `# t.string   :unconfirmed_email # Only if using reconfirmable` |
| 32 | `# t.string   :unlock_token # Only if unlock strategy is :email or :both` |
| 39 | `add_index :users, :email,                unique: true` |

**File:** `db/schema.rb`

| Line | Code |
|------|------|
| 27 | `t.string "email", default: "", null: false` |
| 34 | `t.index ["email"], name: "index_users_on_email", unique: true` |

### devise

**File:** `app/models/user.rb`

| Line | Code |
|------|------|
| 2 | `# Include default devise modules. Others available are:` |
| 4 | `devise :database_authenticatable, :registerable,` |

**File:** `config/initializers/devise.rb`

| Line | Code |
|------|------|
| 23 | `# Use this hook to configure devise mailer, warden hooks and so forth.` |
| 34 | `# Configure the parent class to the devise controllers.` |
| 41 | `config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'` |
| 53 | `require 'devise/orm/active_record'` |
| 113 | `# passing skip: :sessions to \`devise_for\` in your config/routes.rb` |
| 254 | `# Require the \`devise-encryptable\` gem when using anything other than bcrypt` |
| 264 | `# devise role declared in your routes (usually :user).` |
| 307 | `# The router that invoked \`devise_for\`, in the example above, would be:` |

**File:** `config/routes.rb`

| Line | Code |
|------|------|
| 2 | `devise_for :users` |

### rack

**File:** `app/models/user.rb`

| Line | Code |
|------|------|
| 3 | `# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable` |

**File:** `db/migrate/20240327111611_devise_create_users.rb`

| Line | Code |
|------|------|
| 17 | `## Trackable` |

### timeout

**File:** `app/models/user.rb`

| Line | Code |
|------|------|
| 3 | `# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable` |

**File:** `config/initializers/devise.rb`

| Line | Code |
|------|------|
| 202 | `# ==> Configuration for :timeoutable` |
| 203 | `# The time you want to timeout the user session without activity. After this` |
| 205 | `# config.timeout_in = 30.minutes` |

**File:** `config/puma.rb`

| Line | Code |
|------|------|
| 11 | `# Specifies the \`worker_timeout\` threshold that Puma will use to wait before` |
| 14 | `worker_timeout 3600 if ENV.fetch("RAILS_ENV", "development") == "development"` |

### rails

**File:** `config/application.rb`

| Line | Code |
|------|------|
| 3 | `require "rails/all"` |

**File:** `config/environments/development.rb`

| Line | Code |
|------|------|
| 21 | `# Run rails dev:cache to toggle caching.` |

**File:** `config/importmap.rb`

| Line | Code |
|------|------|
| 4 | `pin "@hotwired/turbo-rails", to: "turbo.min.js"` |

**File:** `config/initializers/content_security_policy.rb`

| Line | Code |
|------|------|
| 5 | `# https://guides.rubyonrails.org/security.html#content-security-policy-header` |

**File:** `config/puma.rb`

| Line | Code |
|------|------|
| 42 | `# Allow puma to be restarted by \`bin/rails restart\` command.` |

**File:** `config/routes.rb`

| Line | Code |
|------|------|
| 3 | `# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html` |

**File:** `db/schema.rb`

| Line | Code |
|------|------|
| 5 | `# This file is the source Rails uses to define your schema when running \`bin/rails` |
| 6 | `# db:schema:load\`. When creating a new database, \`bin/rails db:schema:load\` tends to` |

**File:** `db/seeds.rb`

| Line | Code |
|------|------|
| 2 | `# The data can then be loaded with the bin/rails db:seed command (or created alongside the database w` |

**File:** `test/test_helper.rb`

| Line | Code |
|------|------|
| 3 | `require "rails/test_help"` |

### railties

**File:** `config/application.rb`

| Line | Code |
|------|------|
| 14 | `# Configuration for the application, engines, and railties goes here.` |

### bootsnap

**File:** `config/boot.rb`

| Line | Code |
|------|------|
| 4 | `require "bootsnap/setup" # Speed up boot time by caching expensive operations.` |

### i18n

**File:** `config/environments/development.rb`

| Line | Code |
|------|------|
| 63 | `# config.i18n.raise_on_missing_translations = true` |

**File:** `config/environments/production.rb`

| Line | Code |
|------|------|
| 73 | `config.i18n.fallbacks = true` |

**File:** `config/environments/test.rb`

| Line | Code |
|------|------|
| 56 | `# config.i18n.raise_on_missing_translations = true` |

### turbo-rails

**File:** `config/importmap.rb`

| Line | Code |
|------|------|
| 4 | `pin "@hotwired/turbo-rails", to: "turbo.min.js"` |

### chartkick

**File:** `config/importmap.rb`

| Line | Code |
|------|------|
| 8 | `pin "chartkick", to: "chartkick.js"` |

### warden

**File:** `config/initializers/devise.rb`

| Line | Code |
|------|------|
| 23 | `# Use this hook to configure devise mailer, warden hooks and so forth.` |
| 292 | `# change the failure app, you can configure them inside the config.warden block.` |
| 294 | `# config.warden do \|manager\|` |

### bcrypt

**File:** `config/initializers/devise.rb`

| Line | Code |
|------|------|
| 129 | `# For bcrypt, this is the cost for hashing the password and defaults to 12. If` |
| 137 | `# a value less than 10 in other environments. Note that, for bcrypt (the default` |
| 248 | `# Allow you to use another hashing or encryption algorithm besides bcrypt (default).` |
| 254 | `# Require the \`devise-encryptable\` gem when using anything other than bcrypt` |

### puma

**File:** `config/puma.rb`

| Line | Code |
|------|------|
| 42 | `# Allow puma to be restarted by \`bin/rails restart\` command.` |

