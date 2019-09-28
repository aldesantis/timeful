class CreateTimefulFeedItems < ActiveRecord::Migration[4.2]
  def change
    create_table :timeful_feed_items do |t|
      t.string :feedable_type, null: false
      t.integer :feedable_id, null: false
      t.integer :activity_id, null: false

      t.timestamps null: false

      t.foreign_key :timeful_activities, column: :activity_id, on_delete: :cascade

      t.index [:feedable_type, :feedable_id]
    end
  end
end
