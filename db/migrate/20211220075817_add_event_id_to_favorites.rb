class AddEventIdToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :event_id, :integer
  end
end
