# frozen_string_literal: true
FactoryGirl.define do
  factory :feed_item, class: 'Timeful::FeedItem' do
    association :feedable, strategy: :build, factory: :user
    association :activity, strategy: :build
  end
end
