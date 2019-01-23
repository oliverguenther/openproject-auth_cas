require 'omniauth-cas'
require 'open_project/auth_plugins'

module OpenProject
  module AuthCas
    class Engine < ::Rails::Engine
      engine_name :openproject_auth_cas

      include OpenProject::Plugins::ActsAsOpEngine
      extend OpenProject::Plugins::AuthPlugin

      register 'openproject-auth_cas',
               author_url: 'https://github.com/oliverguenther/openproject-auth_cas',
               requires_openproject: '>= 4.0.0'

      assets %w(
        auth_cas/**
      )

      register_auth_providers do
        settings = Rails.root.join('config', 'plugins', 'auth_cas', 'settings.yml')
        if settings.exist?
          providers = YAML::load(File.open(settings)).symbolize_keys
          strategy :cas do
            providers.values.map do |h|
              h[:openproject_attribute_map] = Proc.new { |auth| { login: auth[:uid] } }
              h.symbolize_keys
            end
          end
        else
          Rails.logger.warn("[auth_cas] Missing settings from '#{settings}', skipping omniauth registration.")
        end
      end
    end
  end
end
