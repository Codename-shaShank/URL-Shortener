## Dependency Usages

This document lists where changed gems are referenced in the codebase.

### date

**File:** `.github/scripts/deps_find_usages.rb`

| Line | Code |
|------|------|
| 3 | `# TODO(deps): Review usages of 'date' in this file for version-specific changes.` |
| 36 | `# 2. Find candidate files where we might use these gems` |

**File:** `.github/scripts/deps_llm_suggestions.rb`

| Line | Code |
|------|------|
| 3 | `# TODO(deps): Review usages of 'date' in this file for version-specific changes.` |
| 44 | `text = data.dig("candidates", 0, "content", "parts", 0, "text")` |
| 62 | `You are helping update a small Ruby/Rails app after dependency upgrades.` |

**File:** `.github/scripts/format_changelog_entry.rb`

| Line | Code |
|------|------|
| 3 | `# TODO(deps): Review usages of 'date' in this file for version-specific changes.` |
| 4 | `# Formats Gemini suggestions into a changelog entry and updates docs` |
| 24 | `puts "No Gemini suggestions found, skipping changelog update."` |
| 47 | `### Dependencies Updated` |
| 50 | `### Changes and Updates` |
| 73 | `puts "Updated changelog at: #{CHANGELOG_PATH}"` |
| 78 | `gems_updated: gems_changed,` |

**File:** `.github/scripts/gem_diff.rb`

| Line | Code |
|------|------|
| 3 | `# TODO(deps): Review usages of 'date' in this file for version-specific changes.` |
| 140 | `markdown << "This PR updates the resolved gem set based on changes in \`Gemfile\` / \`Gemfile.lock\` ` |
| 163 | `markdown << "   - ⏳ Generate LLM-powered suggestions for code updates\n"` |
| 164 | `markdown << "   - ⏳ Update \`docs/dependency-upgrades-changelog.md\` with upgrade guide\n"` |
| 172 | `markdown << "   - Update or add code to keep existing behavior working for current versions.\n"` |
| 174 | `markdown << "     - Implement the necessary code updates.\n"` |
| 178 | `markdown << "2. **Changelog and docs updates**:\n"` |
| 179 | `markdown << "   - Update or create \`docs/dependency-upgrades-changelog.md\` (or similar) describing:` |
| 181 | `markdown << "     - What code paths or features were updated.\n"` |

**File:** `app/controllers/links_controller.rb`

| Line | Code |
|------|------|
| 1 | `# TODO(deps): Review usages of 'date' in this file for version-specific changes.` |
| 3 | `before_action :authenticate_user!, only: [:edit, :update, :destroy]` |
| 4 | `before_action :set_link, only: [:show, :edit, :update, :destroy]` |
| 5 | `before_action :allow_editing_link, only: [:edit, :update, :destroy]` |
| 36 | `def update` |
| 37 | `if @link.update(link_params)` |

**File:** `app/jobs/metadata_job.rb`

| Line | Code |
|------|------|
| 1 | `# TODO(deps): Review usages of 'date' in this file for version-specific changes.` |
| 5 | `link.update Metadata.retrieve_from(link.url).attributes` |

**File:** `app/models/link.rb`

| Line | Code |
|------|------|
| 1 | `# TODO(deps): Review usages of 'date' in this file for version-specific changes.` |
| 6 | `validates :url, presence: true` |

**File:** `config/initializers/devise.rb`

| Line | Code |
|------|------|
| 7 | `# TODO(deps): Review usages of 'date' in this file for version-specific changes.` |
| 189 | `# Invalidates all the remember me tokens when the user signs out.` |
| 203 | `# Email regex used to validate email formats. It simply asserts that` |

**File:** `config/initializers/permissions_policy.rb`

| Line | Code |
|------|------|
| 1 | `# TODO(deps): Review usages of 'date' in this file for version-specific changes.` |
| 3 | `# information see https://developers.google.com/web/updates/2018/06/feature-policy` |

**File:** `db/migrate/20240327111611_devise_create_users.rb`

| Line | Code |
|------|------|
| 4 | `# TODO(deps): Review usages of 'date' in this file for version-specific changes.` |
| 15 | `t.datetime :reset_password_sent_at` |
| 18 | `t.datetime :remember_created_at` |
| 22 | `# t.datetime :current_sign_in_at` |
| 23 | `# t.datetime :last_sign_in_at` |
| 29 | `# t.datetime :confirmed_at` |
| 30 | `# t.datetime :confirmation_sent_at` |
| 36 | `# t.datetime :locked_at` |

**File:** `db/schema.rb`

| Line | Code |
|------|------|
| 3 | `# TODO(deps): Review usages of 'date' in this file for version-specific changes.` |
| 23 | `t.datetime "created_at", null: false` |
| 24 | `t.datetime "updated_at", null: false` |
| 33 | `t.datetime "reset_password_sent_at"` |
| 34 | `t.datetime "remember_created_at"` |
| 35 | `t.datetime "created_at", null: false` |
| 36 | `t.datetime "updated_at", null: false` |
| 45 | `t.datetime "created_at", null: false` |
| 46 | `t.datetime "updated_at", null: false` |

### rake

**File:** `.github/scripts/deps_find_usages.rb`

| Line | Code |
|------|------|
| 4 | `# TODO(deps): Review usages of 'rake' in this file for version-specific changes.` |
| 38 | `exts = [".rb", ".rake", ".ru"]` |

### mail

**File:** `app/mailers/application_mailer.rb`

| Line | Code |
|------|------|
| 1 | `# TODO(deps): Review usages of 'mail' in this file for version-specific changes.` |
| 4 | `layout "mailer"` |

**File:** `config/environments/development.rb`

| Line | Code |
|------|------|
| 3 | `# TODO(deps): Review usages of 'mail' in this file for version-specific changes.` |
| 42 | `# Don't care if the mailer can't send.` |
| 43 | `config.action_mailer.raise_delivery_errors = false` |
| 45 | `config.action_mailer.perform_caching = false` |
| 74 | `config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }` |

**File:** `config/environments/production.rb`

| Line | Code |
|------|------|
| 2 | `# TODO(deps): Review usages of 'mail' in this file for version-specific changes.` |
| 67 | `config.action_mailer.perform_caching = false` |
| 69 | `# Ignore bad email addresses and do not raise email delivery errors.` |
| 70 | `# Set this to true and configure the email server for immediate delivery to raise delivery errors.` |
| 71 | `# config.action_mailer.raise_delivery_errors = false` |

**File:** `config/environments/test.rb`

| Line | Code |
|------|------|
| 2 | `# TODO(deps): Review usages of 'mail' in this file for version-specific changes.` |
| 41 | `config.action_mailer.perform_caching = false` |
| 43 | `# Tell Action Mailer not to deliver emails to the real world.` |
| 44 | `# The :test delivery method accumulates sent emails in the` |
| 46 | `config.action_mailer.delivery_method = :test` |

**File:** `config/initializers/devise.rb`

| Line | Code |
|------|------|
| 6 | `# TODO(deps): Review usages of 'mail' in this file for version-specific changes.` |
| 29 | `# Use this hook to configure devise mailer, warden hooks and so forth.` |
| 44 | `# Configure the e-mail address which will be shown in Devise::Mailer,` |
| 45 | `# note that it will be overwritten if you use your own mailer class` |
| 47 | `config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'` |
| 49 | `# Configure the class responsible to send e-mails.` |
| 50 | `# config.mailer = 'Devise::Mailer'` |
| 52 | `# Configure the parent class responsible to send e-mails.` |
| 53 | `# config.parent_mailer = 'ActionMailer::Base'` |
| 63 | `# just :email. You can configure it to use [:username, :subdomain], so for` |
| 69 | `# config.authentication_keys = [:email]` |
| 80 | `# to authenticate or find a user. Default is :email.` |
| 81 | `config.case_insensitive_keys = [:email]` |
| 85 | `# modifying a user and when used to authenticate or find a user. Default is :email.` |
| 86 | `config.strip_whitespace_keys = [:email]` |
| 91 | `# enable it only for database (email + password) authentication.` |
| 111 | `# to behave the same regardless if the e-mail provided was right or wrong.` |
| 151 | `# Send a notification to the original email when the user's email is changed.` |
| 152 | `# config.send_email_changed_notification = false` |
| 154 | `# Send a notification email when the user's password is changed.` |
| 170 | `# their account within 3 days after the mail was sent, but on the fourth day` |
| 176 | `# If true, requires any email changes to be confirmed (exactly the same way as` |
| 177 | `# initial account confirmation) to be applied. Requires additional unconfirmed_email` |
| 178 | `# db field (see migrations). Until confirmed, new email is stored in` |
| 179 | `# unconfirmed_email column, and copied to email column on successful confirmation.` |
| 183 | `# config.confirmation_keys = [:email]` |
| 203 | `# Email regex used to validate email formats. It simply asserts that` |
| 205 | `# to give user feedback and not to assert the e-mail validity.` |
| 206 | `config.email_regexp = /\A[^@\s]+@[^@\s]+\z/` |
| 220 | `# config.unlock_keys = [:email]` |
| 223 | `# :email = Sends an unlock link to the user email` |
| 242 | `# config.reset_password_keys = [:email]` |

**File:** `db/migrate/20240327111611_devise_create_users.rb`

| Line | Code |
|------|------|
| 3 | `# TODO(deps): Review usages of 'mail' in this file for version-specific changes.` |
| 10 | `t.string :email,              null: false, default: ""` |
| 31 | `# t.string   :unconfirmed_email # Only if using reconfirmable` |
| 35 | `# t.string   :unlock_token # Only if unlock strategy is :email or :both` |
| 42 | `add_index :users, :email,                unique: true` |

**File:** `db/schema.rb`

| Line | Code |
|------|------|
| 2 | `# TODO(deps): Review usages of 'mail' in this file for version-specific changes.` |
| 30 | `t.string "email", default: "", null: false` |
| 37 | `t.index ["email"], name: "index_users_on_email", unique: true` |

### timeout

**File:** `app/models/user.rb`

| Line | Code |
|------|------|
| 1 | `# TODO(deps): Review usages of 'timeout' in this file for version-specific changes.` |
| 6 | `# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable` |

**File:** `config/initializers/devise.rb`

| Line | Code |
|------|------|
| 4 | `# TODO(deps): Review usages of 'timeout' in this file for version-specific changes.` |
| 208 | `# ==> Configuration for :timeoutable` |
| 209 | `# The time you want to timeout the user session without activity. After this` |
| 211 | `# config.timeout_in = 30.minutes` |

**File:** `config/puma.rb`

| Line | Code |
|------|------|
| 3 | `# TODO(deps): Review usages of 'timeout' in this file for version-specific changes.` |
| 14 | `# Specifies the \`worker_timeout\` threshold that Puma will use to wait before` |
| 17 | `worker_timeout 3600 if ENV.fetch("RAILS_ENV", "development") == "development"` |

### rack

**File:** `app/models/user.rb`

| Line | Code |
|------|------|
| 2 | `# TODO(deps): Review usages of 'rack' in this file for version-specific changes.` |
| 6 | `# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable` |

**File:** `db/migrate/20240327111611_devise_create_users.rb`

| Line | Code |
|------|------|
| 2 | `# TODO(deps): Review usages of 'rack' in this file for version-specific changes.` |
| 20 | `## Trackable` |

### devise

**File:** `app/models/user.rb`

| Line | Code |
|------|------|
| 3 | `# TODO(deps): Review usages of 'devise' in this file for version-specific changes.` |
| 5 | `# Include default devise modules. Others available are:` |
| 7 | `devise :database_authenticatable, :registerable,` |

**File:** `config/initializers/devise.rb`

| Line | Code |
|------|------|
| 5 | `# TODO(deps): Review usages of 'devise' in this file for version-specific changes.` |
| 29 | `# Use this hook to configure devise mailer, warden hooks and so forth.` |
| 40 | `# Configure the parent class to the devise controllers.` |
| 47 | `config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'` |
| 59 | `require 'devise/orm/active_record'` |
| 119 | `# passing skip: :sessions to \`devise_for\` in your config/routes.rb` |
| 260 | `# Require the \`devise-encryptable\` gem when using anything other than bcrypt` |
| 270 | `# devise role declared in your routes (usually :user).` |
| 313 | `# The router that invoked \`devise_for\`, in the example above, would be:` |

**File:** `config/routes.rb`

| Line | Code |
|------|------|
| 2 | `# TODO(deps): Review usages of 'devise' in this file for version-specific changes.` |
| 4 | `devise_for :users` |

### railties

**File:** `config/application.rb`

| Line | Code |
|------|------|
| 1 | `# TODO(deps): Review usages of 'railties' in this file for version-specific changes.` |
| 16 | `# Configuration for the application, engines, and railties goes here.` |

### rails

**File:** `config/application.rb`

| Line | Code |
|------|------|
| 2 | `# TODO(deps): Review usages of 'rails' in this file for version-specific changes.` |
| 5 | `require "rails/all"` |

**File:** `config/environments/development.rb`

| Line | Code |
|------|------|
| 2 | `# TODO(deps): Review usages of 'rails' in this file for version-specific changes.` |
| 24 | `# Run rails dev:cache to toggle caching.` |

**File:** `config/importmap.rb`

| Line | Code |
|------|------|
| 2 | `# TODO(deps): Review usages of 'turbo-rails' in this file for version-specific changes.` |
| 3 | `# TODO(deps): Review usages of 'rails' in this file for version-specific changes.` |
| 7 | `pin "@hotwired/turbo-rails", to: "turbo.min.js"` |

**File:** `config/initializers/content_security_policy.rb`

| Line | Code |
|------|------|
| 1 | `# TODO(deps): Review usages of 'rails' in this file for version-specific changes.` |
| 6 | `# https://guides.rubyonrails.org/security.html#content-security-policy-header` |

**File:** `config/puma.rb`

| Line | Code |
|------|------|
| 2 | `# TODO(deps): Review usages of 'rails' in this file for version-specific changes.` |
| 45 | `# Allow puma to be restarted by \`bin/rails restart\` command.` |

**File:** `config/routes.rb`

| Line | Code |
|------|------|
| 1 | `# TODO(deps): Review usages of 'rails' in this file for version-specific changes.` |
| 5 | `# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html` |

**File:** `db/schema.rb`

| Line | Code |
|------|------|
| 1 | `# TODO(deps): Review usages of 'rails' in this file for version-specific changes.` |
| 8 | `# This file is the source Rails uses to define your schema when running \`bin/rails` |
| 9 | `# db:schema:load\`. When creating a new database, \`bin/rails db:schema:load\` tends to` |

**File:** `db/seeds.rb`

| Line | Code |
|------|------|
| 1 | `# TODO(deps): Review usages of 'rails' in this file for version-specific changes.` |
| 3 | `# The data can then be loaded with the bin/rails db:seed command (or created alongside the database w` |

**File:** `test/test_helper.rb`

| Line | Code |
|------|------|
| 1 | `# TODO(deps): Review usages of 'rails' in this file for version-specific changes.` |
| 4 | `require "rails/test_help"` |

### bootsnap

**File:** `config/boot.rb`

| Line | Code |
|------|------|
| 1 | `# TODO(deps): Review usages of 'bootsnap' in this file for version-specific changes.` |
| 5 | `require "bootsnap/setup" # Speed up boot time by caching expensive operations.` |

### i18n

**File:** `config/environments/development.rb`

| Line | Code |
|------|------|
| 1 | `# TODO(deps): Review usages of 'i18n' in this file for version-specific changes.` |
| 66 | `# config.i18n.raise_on_missing_translations = true` |

**File:** `config/environments/production.rb`

| Line | Code |
|------|------|
| 1 | `# TODO(deps): Review usages of 'i18n' in this file for version-specific changes.` |
| 75 | `config.i18n.fallbacks = true` |

**File:** `config/environments/test.rb`

| Line | Code |
|------|------|
| 1 | `# TODO(deps): Review usages of 'i18n' in this file for version-specific changes.` |
| 58 | `# config.i18n.raise_on_missing_translations = true` |

### chartkick

**File:** `config/importmap.rb`

| Line | Code |
|------|------|
| 1 | `# TODO(deps): Review usages of 'chartkick' in this file for version-specific changes.` |
| 11 | `pin "chartkick", to: "chartkick.js"` |

### turbo-rails

**File:** `config/importmap.rb`

| Line | Code |
|------|------|
| 2 | `# TODO(deps): Review usages of 'turbo-rails' in this file for version-specific changes.` |
| 7 | `pin "@hotwired/turbo-rails", to: "turbo.min.js"` |

### bcrypt

**File:** `config/initializers/devise.rb`

| Line | Code |
|------|------|
| 2 | `# TODO(deps): Review usages of 'bcrypt' in this file for version-specific changes.` |
| 135 | `# For bcrypt, this is the cost for hashing the password and defaults to 12. If` |
| 143 | `# a value less than 10 in other environments. Note that, for bcrypt (the default` |
| 254 | `# Allow you to use another hashing or encryption algorithm besides bcrypt (default).` |
| 260 | `# Require the \`devise-encryptable\` gem when using anything other than bcrypt` |

### warden

**File:** `config/initializers/devise.rb`

| Line | Code |
|------|------|
| 3 | `# TODO(deps): Review usages of 'warden' in this file for version-specific changes.` |
| 29 | `# Use this hook to configure devise mailer, warden hooks and so forth.` |
| 298 | `# change the failure app, you can configure them inside the config.warden block.` |
| 300 | `# config.warden do \|manager\|` |

### puma

**File:** `config/puma.rb`

| Line | Code |
|------|------|
| 1 | `# TODO(deps): Review usages of 'puma' in this file for version-specific changes.` |
| 45 | `# Allow puma to be restarted by \`bin/rails restart\` command.` |

