# frozen_string_literal: true
RSpec.describe Timeful::Model::Subscriber do
  subject { create(:user) }

  describe '#feed_items' do
    it "returns the items in the user's feeds" do
      feed_item = create(:feed_item, subscriber: subject)
      expect(subject.feed_items).to match_array([feed_item])
    end

    it 'orders items by newest to oldest' do
      oldest_item = create(:feed_item, subscriber: subject)
      newest_item = create(:feed_item, subscriber: subject)
      expect(subject.feed_items).to eq([newest_item, oldest_item])
    end
  end
end
