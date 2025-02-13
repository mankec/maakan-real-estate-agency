# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"

pin_all_from "app/javascript/controllers", under: "controllers"

pin "jquery", to: "https://code.jquery.com/jquery-3.6.0.min.js"
pin "main"
pin "easing"
pin "easing.min"
pin "owl.carousel"
pin "owl.carousel.min"
pin "waypoints.min"
pin "wow"
pin "wow.min"
pin "bootstrap", to: "bootstrap.min.js"
