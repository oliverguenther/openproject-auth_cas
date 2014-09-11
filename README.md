# OpenProject OmniAuth CAS Single-Sign On
![](https://github.com/oliverguenther/openproject-auth_cas/blob/dev/app/assets/images/auth_provider-cas.png)

This plugin provides the [OmniAuth CAS strategy](https://github.com/dlindahl/omniauth-cas) into OpenProject.

## Installation

Add the following entries to your `Gemfile.plugins` in your OpenProject root directory:

	gem 'openproject-auth_plugins', :git => 'https://github.com/opf/openproject-auth_plugins', :branch => 'dev'
	gem "openproject-auth_cas", :git => 'https://github.com/oliverguenther/openproject-auth_cas', :branch => 'dev'


**Important!**

omniauth-cas specifies the requirement omniauth ~> 1.1.0. However, as OpenProject depends on omniauth ~> 1.2.0, you can use my fork of the project that fixes this until the gem itself is updated: 

Simply create a ``Gemfile.local`` in your OpenProject root with the following content:

	gem 'omniauth-cas', git: https://github.com/oliverguenther/omniauth-cas
	
## Requirements

* [omniauth-cas gem](https://github.com/dlindahl/omniauth-cas) > 1.0.4
* [OpenProject](http://openproject.org) > 4.0
* [openproject-auth](https://github.com/opf/openproject-auth_plugins)	


## Configuration

To add your own CAS strategy provider(s), create the following settings file (relative to your OpenProject root):

	config/plugins/auth_cas/settings.yml
	
with the following contents:

	your-provider-name:
	  name: "your-provider-name"
	  url: "https://sso.example.org"
	  display_name: "My CAS provider"	
	  # Use the default CAS icon
	  icon: "auth_provider-cas.png"
	  # Extended Attributes mapping
	  uid_key: "username"

The plugin simply passes all options to omniauth-cas. See [their configuration documentation](https://github.com/dlindahl/omniauth-cas#configuration-options) for further details.

### Multiple Providers

If you have the use-case of multiple CAS / Single-Sign On providers, simply add several providers to your yaml config, OpenProject will handle the rest automatically.

	  
### Custom Provider Icon

To add a custom icon to be rendered as your omniauth provider icon, add an image asset and reference it in your `settings.yml`:

	icon: "my/asset/path/to/icon.png"
	

## Copyrights & License
OpenProject CAS Auth is completely free and open source and released under the [MIT License](https://github.com/oliverguenther/openproject-auth_cas/blob/dev/LICENSE).

Copyright (c) 2014 Oliver Günther (mail@oliverguenther.de)

The default provider icon is a combination of icons from [Font Awesome by Dave Gandy](http://fontawesome.io).