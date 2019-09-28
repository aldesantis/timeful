# frozen_string_literal: true
FactoryBot.define do
  factory :activity, class: 'Timeful::Activity' do
    type { 'PostActivity' }
    association :actor, strategy: :build, factory: :user
    association :target, strategy: :build, factory: :post
  end
end
