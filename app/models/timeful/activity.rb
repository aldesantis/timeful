# frozen_string_literal: true
module Timeful
  # An activity is something that happens in your application. It's comprised of an actor, an
  # action and an target.
  #
  # An example activity might be: "John Doe (actor) published (action) a new post (target)."
  #
  # @author Alessandro Desantis
  #
  # @abstract Subclass and override {#subscribers} to implement your own activity
  #
  # @example
  #   class CommentCreatedActivity < Timeful::Activity
  #     def subscribers
  #       [target.post.author]
  #     end
  #   end
  class Activity < ApplicationRecord
    belongs_to :actor, polymorphic: true
    belongs_to :target, polymorphic: true

    # Returns the users that subscribe to this activity. A {FeedItem} linked to the activity will
    # be created for these users.
    #
    # The returned value can be an instance of either +ActiveRecord::Relation+ or +Array+. The
    # former is preferred when the subscribers list is very long, as we'll automatically use
    # +find_each+ to reduce memory usage if it's available.
    #
    # @raise NotImplementedError
    def subscribers
      fail NotImplementedError
    end
  end
end
