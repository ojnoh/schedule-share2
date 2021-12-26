class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :body
      t.integer :genre
      t.boolean :disp_flg
      t.datetime :start
      t.datetime :end
      t.boolean :record_flg, default: false, null: false
      t.text :reason

      t.timestamps
    end
  end
end
