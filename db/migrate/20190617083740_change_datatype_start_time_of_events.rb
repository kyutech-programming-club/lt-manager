class ChangeDatatypeStartTimeOfEvents < ActiveRecord::Migration[5.2]
  def up
    remove_column :events, :start_time
    remove_column :events, :end_time
  end

  def down
    add_column :events, :start_time, :time
    add_column :events, :end_time, :time
  end
end
