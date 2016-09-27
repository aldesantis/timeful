# frozen_string_literal: true
module Timeful
  module Model
    # A subscriber can subscribe to activities and get a new feed item for each new instance of
    # that activity.
    #
    # @author Alessandro Desantis
    #
    # @example
    #   subscriber.feed_items # => #<ActiveRecord::Associations::CollectionProxy>
    module Subscriber
      def self.included(klass)
        klass.class_eval do
          has_many :feed_items, -> { order(created_at: :desc) },
            as: :feedable,
            class_name: 'Timeful::FeedItem'
        end
      end
    end
  end
end
