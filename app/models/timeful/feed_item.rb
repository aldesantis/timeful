# frozen_string_literal: true
module Timeful
  class FeedItem < ApplicationRecord
    belongs_to :feedable, polymorphic: true
    belongs_to :activity
  end
end
