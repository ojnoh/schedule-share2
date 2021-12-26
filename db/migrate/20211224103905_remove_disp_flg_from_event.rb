class RemoveDispFlgFromEvent < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :disp_flg, :boolean
  end
end
