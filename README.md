# OpenProject OmniAuth CAS Single-Sign On
![](https://github.com/oliverguenther/openproject-auth_cas/blob/dev/app/assets/images/auth_provider-cas.png)

[![Dependency Status](https://gemnasium.com/oliverguenther/openproject-auth_cas.svg)](https://gemnasium.com/oliverguenther/openproject-auth_cas)
[![Code Climate](https://codeclimate.com/github/oliverguenther/openproject-auth_cas/badges/gpa.svg)](https://codeclimate.com/github/oliverguenther/openproject-auth_cas)


This plugin provides the [OmniAuth CAS strategy](https://github.com/dlindahl/omniauth-cas) into OpenProject.

## Installation

Add the following entries to your `Gemfile.plugins` in your OpenProject root directory:

```
gem "openproject-auth_cas", git: 'git@github.com:oliverguenther/openproject-auth_cas', branch: 'stable'
```

For OpenProject < 8.2.0, please manually add the Auth Plugins gem before adding `openproject-auth_cas`:

```
gem 'openproject-auth_plugins', git: 'git@github.com:finnlabs/openproject-auth_plugins', branch: 'stable'
gem "openproject-auth_cas", git: 'git@github.com:oliverguenther/openproject-auth_cas', branch: 'stable'
```


## Requirements

* [omniauth-cas gem](https://github.com/dlindahl/omniauth-cas)
* [OpenProject](http://openproject.org)
* [openproject-auth_plugins](https://github.com/opf/openproject-auth_plugins) (Included in OpenProject core since 8.2.0)


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

To add a custom icon to be rendered as your omniauth provider icon, add an image asset to OpenProject and reference it in your `settings.yml`:

	icon: "my/asset/path/to/icon.png"
	

## Copyrights & License
OpenProject CAS Auth is completely free and open source and released under the [MIT License](https://github.com/oliverguenther/openproject-auth_cas/blob/dev/LICENSE).

Copyright (c) 2014-2019 Oliver Günther (mail@oliverguenther.de)

The default provider icon is a combination of icons from [Font Awesome by Dave Gandy](http://fontawesome.io).
