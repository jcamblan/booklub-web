# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BooklubWeb
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    config.eager_load_paths << Rails.root.join('extras')

    config.generators do |g|
      # Force generators to use UUIDs instead of integers as ids
      g.orm :active_record, primary_key_type: :uuid
      # Ignore jsons
      g.jbuilder = false
    end
    config.time_zone = 'Paris'
    config.i18n.default_locale = 'fr'
  end
end
