class AddRecordFlgToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :record_flg, :boolean, default: false, null: false
  end
end
