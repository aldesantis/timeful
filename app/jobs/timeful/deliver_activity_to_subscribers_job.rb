# frozen_string_literal: true
module Timeful
  # Creates a feed item for each subscriber of the activity.
  #
  # @author Alessandro Desantis
  class DeliverActivityToSubscribersJob < ActiveJob::Base
    queue_as { Timeful.jobs_queue }

    def perform(activity)
      RelationProxy.new(activity.subscribers).find_each do |subscriber|
        subscriber.feed_items.create!(activity: activity)
      end
    end
  end
end
