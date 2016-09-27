# Timeful

[![Gem Version](https://img.shields.io/gem/v/timeful.svg?maxAge=3600&style=flat-square)](https://rubygems.org/gems/timeful)
[![Dependency Status](https://img.shields.io/gemnasium/alessandro1997/timeful.svg?maxAge=3600&style=flat-square)](https://gemnasium.com/github.com/alessandro1997/timeful)
[![Code Climate](https://img.shields.io/codeclimate/github/alessandro1997/timeful.svg?maxAge=3600&style=flat-square)](https://codeclimate.com/github/alessandro1997/timeful)

Timeful is a Ruby on Rails engine for building timelines (aka "activity streams").

## Why another gem?

There are battle-tested activity stream builders out there already (the most notable being
[PublicActivity](https://github.com/chaps-io/public_activity),
[TimelineFu](https://github.com/jamesgolick/timeline_fu) and
[Social Stream](https://github.com/ging/social_stream)).

However, these gems do not really create a feed for each user, but simply record a list of global
activities and leave you to deal with the retrieval.

Timeful is different: it takes a simple approach at building user feeds and allows you to obtain
an ordered list of feed items for each user.

Also, Timeful does not handle presentation: you will have to build your own views and controllers to
expose feeds. This keeps the codebase smaller and allows you to easily integrate Timeful in JSON
APIs.

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

Finally, add the following to the model that will have a feed and publish activities (this is
usually your `User` model, but you can use two different models):

```ruby
class User < ActiveRecord::Base
  include Timeful::Model::Feedable
  include Timeful::Model::Actor
end
```

## Usage

Timeful revolves around three core concepts:

- **Activity**: An _action_ taken by an _actor_ on an _object_. _Metadata_ can also be attached to
  activities. An example would be "John Doe (actor) wrote (action) a comment (object)."
- **Feed**: A collection of activities that should be accessible by a specific user.
- **Feed item**: The instance of an activity in a user's feed.

Each activity action (or "type") has its own class. This is required because Timeful has to know
which feeds the activity should be added to.

To avoid polluting `app/models`, it is recommended to put your activities in the `app/activities`
directory.

Here's an example activity:

```ruby
class CommentActivity < Timeful::Activity
  def subscribers
    [object.post.author]
  end
end
```

Now, you can publish the `comment` activity:

```ruby
user.publish_activity :comment, object: comment
```

This will create an `Activity` and link it to the author's feed through a `FeedItem`:

```ruby
author = comment.post.author
author.feed_items.count # => 1
```

## Performance

TODO: Write performance considerations

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/alessandro1997/timeful.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
