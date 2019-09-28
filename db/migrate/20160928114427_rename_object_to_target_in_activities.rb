class RenameObjectToTargetInActivities < ActiveRecord::Migration[4.2]
  def change
    rename_column :timeful_activities, :object_id, :target_id
    rename_column :timeful_activities, :object_type, :target_type
  end
end
