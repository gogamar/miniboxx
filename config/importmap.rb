# Pin npm packages by running ./bin/importmap
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"

pin "tailwindcss-stimulus-components", to: "https://cdn.jsdelivr.net/npm/tailwindcss-stimulus-components@5.0.2/+esm", preload: true
pin "application", preload: true
