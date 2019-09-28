class AddMetaToActivities < ActiveRecord::Migration[4.2]
  def change
    add_column :timeful_activities, :meta, :text
  end
end
