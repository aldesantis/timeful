# frozen_string_literal: true
RSpec.describe Timeful::Model::Actor do
  subject { create(:user) }

  let(:post) { create(:post) }

  describe '#publish_activity' do
    it 'creates a new activity' do
      expect {
        subject.publish_activity :post, target: post
      }.to change(PostActivity, :count).by(1)
    end

    it 'creates a feed item for subscribers' do
      expect {
        subject.publish_activity :post, target: post
      }.to enqueue_job(Timeful::DeliverActivityToSubscribersJob)
    end
  end
end
