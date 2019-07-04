class AddDetailToTalks < ActiveRecord::Migration[5.2]
  def change
    add_column :talks, :sequence, :integer
  end
end
