class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :date
      t.string :start_time
      t.string :end_time
      t.string :location
      t.string :talks

      t.timestamps
    end
  end
end
