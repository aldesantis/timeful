# This migration comes from timeful (originally 20160928120033)
class AddMetaToActivities < ActiveRecord::Migration[5.0]
  def change
    add_column :timeful_activities, :meta, :text
  end
end
