# This migration comes from timeful (originally 20160928104602)
class RenameFeedableToSubscriberInFeedItems < ActiveRecord::Migration[5.0]
  def change
    rename_column :timeful_feed_items, :feedable_type, :subscriber_type
    rename_column :timeful_feed_items, :feedable_id, :subscriber_id
  end
end
