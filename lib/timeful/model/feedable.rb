# frozen_string_literal: true
module Timeful
  module Model
    module Feedable
      def self.included(klass)
        klass.class_eval do
          has_many :feed_items, class_name: 'Timeful::FeedItem', inverse_of: :user
        end
      end
    end
  end
end
