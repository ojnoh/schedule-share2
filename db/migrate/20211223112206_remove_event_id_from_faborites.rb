class RemoveEventIdFromFaborites < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites, :event_id, :integer
  end
end
