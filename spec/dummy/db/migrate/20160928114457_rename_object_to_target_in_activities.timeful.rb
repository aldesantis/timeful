# This migration comes from timeful (originally 20160928114427)
class RenameObjectToTargetInActivities < ActiveRecord::Migration[5.0]
  def change
    rename_column :timeful_activities, :object_id, :target_id
    rename_column :timeful_activities, :object_type, :target_type
  end
end
