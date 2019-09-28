class ChangeForeignIdsToString < ActiveRecord::Migration[4.2]
  def up
    change_column :timeful_feed_items, :subscriber_id, :string
    change_column :timeful_activities, :actor_id, :string
    change_column :timeful_activities, :object_id, :string
  end

  def down
    change_column :timeful_feed_items, :subscriber_id, :integer
    change_column :timeful_activities, :actor_id, :integer
    change_column :timeful_activities, :object_id, :integer
  end
end
