# frozen_string_literal: true
module Timeful
  module Model
    # An actor can publish activities.
    #
    # @author Alessandro Desantis
    module Actor
      def self.included(klass)
        klass.include InstanceMethods
      end

      module InstanceMethods # rubocop:disable Style/Documentation
        # Publishes an activity and creates a feed item for each subscriber.
        #
        # @param action [Symbol] the action (or activity type) to create
        # @param object [ActiveRecord::Base] the object the action was taken upon
        #
        # @return [Activity] the created activity
        #
        # @example
        #   actor.publish_activity :post_created, object: post
        #   # => #<PostCreatedActivity>
        def publish_activity(action, object:)
          activity = activity_klass(action).create!(object: object, actor: self)

          RelationProxy.new(activity.subscribers).find_each do |subscriber|
            subscriber.feed_items.create!(activity: activity)
          end

          activity
        end

        private

        def activity_klass(action)
          "#{action.to_s.camelize}Activity".constantize
        end
      end
    end
  end
end
