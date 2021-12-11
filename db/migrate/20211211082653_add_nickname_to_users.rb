class AddNicknameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string
    add_column :users, :profile_image_id, :string
    add_column :users, :genre, :integer
    add_column :users, :point, :text
  end
end
