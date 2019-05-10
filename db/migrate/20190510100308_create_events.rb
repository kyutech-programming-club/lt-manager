class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.time :start_time
      t.time :end_time
      t.string :location
      t.text :talks

      t.timestamps
    end
  end
end
