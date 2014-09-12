module OpenProject::AuthCas::Patches
  module OmniauthLoginPatch

    def self.included(base)
      base.class_eval do
        unloadable

        include InstanceMethods

        alias_method_chain :omniauth_hash_to_user_attributes,  :username

      end
    end

    module InstanceMethods

      def omniauth_hash_to_user_attributes_with_username(auth)
        info = auth[:info]

        # Grab the default attribute mapping
        hash = omniauth_hash_to_user_attributes_without_username

        # Override username if applicable
        hash[:login] = info[:uid] if info[:uid]

        hash
      end

    end

  end
end

Concerns::OmniauthLogin.send(:include, OpenProject::AuthCas::Patches::OmniauthLoginPatch)
