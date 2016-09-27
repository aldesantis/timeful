# frozen_string_literal: true
RSpec.describe Timeful::Model::Actor do
  subject { create(:user) }

  let(:post) { create(:post) }

  describe '#publish_activity' do
    it 'creates a new activity' do
      expect {
        subject.publish_activity :post, object: post
      }.to change(PostActivity, :count).by(1)
    end

    it 'creates a feed item for subscribers' do
      create(:user)
      expect {
        subject.publish_activity :post, object: post
      }.to change(FeedItem, :count).by(1)
    end
  end
end
