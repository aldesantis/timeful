# frozen_string_literal: true
FactoryGirl.define do
  factory :activity, class: 'Timeful::Activity' do
    type 'PostActivity'
    association :actor, strategy: :build, factory: :user
    association :object, strategy: :build, factory: :post
  end
end
