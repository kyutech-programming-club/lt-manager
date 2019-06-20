class AddEventIdToTalk < ActiveRecord::Migration[5.2]
  def change
    add_reference :talks, :event, foreign_key: true
  end
end
