require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module TgFatec
  class Application < Rails::Application
    config.app_generators.scaffold_controller :responders_controller

    config.autoload_paths += %W(#{config.root}/lib)
    config.time_zone = 'Brasilia'

    config.i18n.enforce_available_locales = true
    config.i18n.default_locale = 'pt-BR'

    config.active_record.raise_in_transactional_callbacks = true

    config.middleware.insert_before 0, "Rack::Cors" do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :delete, :put, :options]
      end
    end
  end
end
