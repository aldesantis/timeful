# frozen_string_literal: true
FactoryBot.define do
  factory :feed_item, class: 'Timeful::FeedItem' do
    association :subscriber, strategy: :build, factory: :user
    association :activity, strategy: :build
  end
end
