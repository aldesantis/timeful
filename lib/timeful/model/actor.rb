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
        # @param target [ActiveRecord::Base] the target the action was taken upon
        # @param meta [Hash] any metadata to attach to the activity
        #
        # @return [Activity] the created activity
        #
        # @example
        #   actor.publish_activity :post_created, target: post # => #<PostCreatedActivity>
        def publish_activity(action, target:, meta: {})
          activity = activity_klass(action).create! target: target, meta: meta, actor: self
          DeliverActivityToSubscribersJob.perform_later activity
        end

        private

        def activity_klass(action)
          "#{action.to_s.camelize}Activity".constantize
        end
      end
    end
  end
end
