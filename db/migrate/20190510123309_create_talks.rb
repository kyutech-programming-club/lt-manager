class CreateTalks < ActiveRecord::Migration[5.2]
  def change
    create_table :talks do |t|
      t.string :title
      t.string :slide_url
      t.string :movie_url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
