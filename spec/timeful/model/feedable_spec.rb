# frozen_string_literal: true
RSpec.describe Timeful::Model::Feedable do
  subject { create(:user) }

  let(:feed_item) { create(:feed_item, feedable: subject) }

  describe '#feed_items' do
    it "returns the items in the user's feeds" do
      expect(subject.feed_items).to match_array([feed_item])
    end
  end
end
