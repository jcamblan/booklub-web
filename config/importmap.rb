# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'local-time', to: 'https://ga.jspm.io/npm:local-time@2.1.0/app/assets/javascripts/local-time.js'
pin '@github/combobox-nav', to: 'https://ga.jspm.io/npm:@github/combobox-nav@2.0.2/dist/index.js'
pin 'lodash.debounce', to: 'https://ga.jspm.io/npm:lodash.debounce@4.0.8/index.js'
pin 'stimulus-carousel', to: 'https://ga.jspm.io/npm:stimulus-carousel@4.0.0/dist/stimulus-carousel.es.js'
pin '@hotwired/stimulus', to: 'https://ga.jspm.io/npm:@hotwired/stimulus@3.0.1/dist/stimulus.js'
pin 'dom7', to: 'https://ga.jspm.io/npm:dom7@4.0.2/dom7.esm.js'
pin 'ssr-window', to: 'https://ga.jspm.io/npm:ssr-window@4.0.2/ssr-window.esm.js'
pin 'swiper/bundle', to: 'https://ga.jspm.io/npm:swiper@7.4.1/swiper-bundle.esm.js'
pin "stimulus-use", to: "https://ga.jspm.io/npm:stimulus-use@0.41.0/dist/index.js"
pin "hotkeys-js", to: "https://ga.jspm.io/npm:hotkeys-js@3.8.7/dist/hotkeys.esm.js"
pin "stimulus", to: "https://ga.jspm.io/npm:stimulus@2.0.0/dist/stimulus.umd.js"
