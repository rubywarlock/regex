class CreatePreLists < ActiveRecord::Migration
  def change
    create_table :pre_lists do |t|
      t.integer :user_id
      t.integer :list_id
      t.integer :row_num
      t.integer :col_num
      t.string :content

      t.timestamps
    end
  end
end
