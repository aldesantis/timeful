# frozen_string_literal: true
module Timeful
  module Model
    module Feedable
      def self.included(klass)
        klass.class_eval do
          has_many :feed_items, as: :feedable, class_name: 'Timeful::FeedItem'
        end
      end
    end
  end
end
