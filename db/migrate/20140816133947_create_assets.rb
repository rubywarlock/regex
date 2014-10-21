class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :name
      t.string :type
      t.integer :user_id
      t.integer :image_id
      t.integer :group_id
      t.string :path

      t.timestamps
    end
  end
end
