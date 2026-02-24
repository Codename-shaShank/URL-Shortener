# TODO(deps): Review usages of 'chartkick' in this file for version-specific changes.
# TODO(deps): Review usages of 'turbo-rails' in this file for version-specific changes.
# TODO(deps): Review usages of 'rails' in this file for version-specific changes.
# TODO(deps): Review usages of 'pp' in this file for version-specific changes.
# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "chartkick", to: "chartkick.js"
pin "Chart.bundle", to: "Chart.bundle.js"
pin "clipboard" # @2.0.11
