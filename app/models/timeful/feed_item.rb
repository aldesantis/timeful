# frozen_string_literal: true
module Timeful
  # A feed item is an instance of an activity in a specific user's feed.
  #
  # Feed items are automatically created by Timeful when an activity is created for all subscribers
  # of the activty.
  #
  # @author Alessandro Desantis
  class FeedItem < ApplicationRecord
    belongs_to :subscriber, polymorphic: true
    belongs_to :activity
  end
end
