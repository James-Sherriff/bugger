require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Bugger
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    Rack::Utils.key_space_limit = 362144 
    
    config.app_key = "mysecretkey"
    
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
