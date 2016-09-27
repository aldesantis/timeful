# Timeful

[![Gem Version](https://img.shields.io/gem/v/timeful.svg?maxAge=3600&style=flat-square)](https://rubygems.org/gems/timeful)
[![Dependency Status](https://img.shields.io/gemnasium/alessandro1997/timeful.svg?maxAge=3600&style=flat-square)](https://gemnasium.com/github.com/alessandro1997/timeful)
[![Code Climate](https://img.shields.io/codeclimate/github/alessandro1997/timeful.svg?maxAge=3600&style=flat-square)](https://codeclimate.com/github/alessandro1997/timeful)

Timeful is a Ruby on Rails engine for building timelines (aka _activity streams_).

## Why another gem?

TODO: Write about difference between Timeful and other gems

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'timeful'
```

And then execute:

```console
$ bundle
```

Or install it yourself as:

```console
$ gem install timeful
```

Then, run the installer generator:

```console
$ rails g timeful:install
$ rake db:migrate
```

Finally, add the following to the model that will receive the notifications (e.g. `User`):

```ruby
class User < ActiveRecord::Base
  include Timeful::Feedable
end
```

## Usage

TODO: Write usage instructions

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/alessandro1997/timeful.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
