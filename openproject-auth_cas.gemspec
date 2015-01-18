# encoding: UTF-8
$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'open_project/auth_cas/version'
# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'openproject-auth_cas'
  s.version     = OpenProject::AuthCas::VERSION
  s.authors     = 'Oliver Günther'
  s.email       = 'mail@oliverguenther.de'
  s.homepage    = 'https://github.com/oliverguenther/openproject-auth_cas'
  s.summary     = 'OmniAuth CAS / Single-Sign On'
  s.description = 'Adds the OmniAuth CAS provider to OpenProject'
  s.license     = 'MIT'

  s.files = Dir['{app,lib}/**/*'] + %w(README.md)

  s.add_dependency 'rails', '~> 3.2.14'
  s.add_dependency 'omniauth-cas', '~> 1.0.4'
end
