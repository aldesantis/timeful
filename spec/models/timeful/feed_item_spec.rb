# frozen_string_literal: true
RSpec.describe Timeful::FeedItem do
  subject { build_stubbed(:activity) }

  it 'is valid' do
    expect(subject).to be_valid
  end
end
