# frozen_string_literal: true
FactoryGirl.define do
  factory :activity, class: 'Timeful::Activity' do
    type 'PostActivity'
    association :actor, strategy: :build, factory: :user
    association :target, strategy: :build, factory: :post
  end
end
