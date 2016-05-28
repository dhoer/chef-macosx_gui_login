# Mac OS X GUI Login Cookbook

[![Cookbook Version](http://img.shields.io/cookbook/v/macosx_gui_login.svg?style=flat-square)][cookbook]
[![Build Status](http://img.shields.io/travis/dhoer/chef-macosx_gui_login.svg?style=flat-square)][travis]
[![GitHub Issues](http://img.shields.io/github/issues/dhoer/chef-macosx_gui_login.svg?style=flat-square)]
[github]

[cookbook]: https://supermarket.chef.io/cookbooks/macosx_gui_login
[travis]: https://travis-ci.org/dhoer/chef-macosx_gui_login
[github]: https://github.com/dhoer/chef-macosx_gui_login/issues

This cookbook logs into Mac OS X GUI via AppleScript.

## Requirements

- Chef 12 or higher (you can use Chef 11, but sensitive attribute won't work)

### Platforms

- Mac OS X - Mountain Lion (10.8) or higher

## Usage

Include cookbook as a dependency before calling `macosx_gui_login` resource.

### Actions

- `run` - Logs into GUI.

### Attributes

- `username` (required) - Username to login as. Defaults to the name of the resource block.
- `password` (required) - Password of user.
- `sensitive` - Suppress logging stdout and stderr to Chef-client.  Default: `true`.

### Examples

Login as vagrant user:

```ruby
macosx_gui_login 'login to vagrant user' do
  username 'vagrant'
  password 'vagrant'
  sensitive true
  action :run
end
```

## ChefSpec Matchers

This cookbook includes custom [ChefSpec](https://github.com/sethvargo/chefspec) matchers you can use to test 
your own cookbooks.

Example Matcher Usage

```ruby
expect(chef_run).to run_macosx_gui_login('login to vagrant user').with(
  username: 'vagrant',
  password: 'vagrant',
  sensitive: true
)
```
      
Cookbook Matchers

- run_macosx_gui_login(resource_name)

## Getting Help

- Ask specific questions on [Stack Overflow](http://stackoverflow.com/questions/tagged/osascript).
- Report bugs and discuss potential features in
[Github issues](https://github.com/dhoer/chef-macosx_gui_login/issues).

## Contributing

Please refer to [CONTRIBUTING](https://github.com/dhoer/chef-macosx_gui_login/blob/master/CONTRIBUTING.md).

## License

MIT - see the accompanying [LICENSE](https://github.com/dhoer/chef-macosx_gui_login/blob/master/LICENSE.md) 
file for details.
