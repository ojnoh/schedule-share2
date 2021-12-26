class RemoveRecordFlgFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :record_flg, :boolean
  end
end
