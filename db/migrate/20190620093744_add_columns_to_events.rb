class AddColumnsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :start_time, :datetime
    add_column :events, :end_time, :datetime
  end
end
