# frozen_string_literal: true
RSpec.describe Timeful::DeliverActivityToSubscribersJob do
  subject { -> { described_class.perform_now(activity) } }

  let(:subscriber) { build_stubbed(:user) }
  let(:activity) { build_stubbed(:activity) }

  before { allow(activity).to receive(:subscribers).and_return([subscriber]) }

  it 'creates a feed item for each subscriber of the activity' do
    expect(subscriber.feed_items).to receive(:create!)
      .with(activity: activity)
      .once

    subject.call
  end
end
