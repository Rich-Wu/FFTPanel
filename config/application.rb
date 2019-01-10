require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module FFTPanel
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.assets.paths << Rails.root.join("app", "assets", "images", "portraits")
  end
end

def age(birthday)
  age = 0
  loop do
    birthday = birthday.advance(years: 1)
    break if birthday > Date.current
    age = age + 1
  end
  age
end

def education(num)
  if num == 1
    "High School"
  elsif num == 2
    "College"
  elsif num == 3
    "Masters"
  elsif num == 4
    "PHD"
  end
end
