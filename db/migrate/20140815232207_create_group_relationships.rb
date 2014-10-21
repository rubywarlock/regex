class CreateGroupRelationships < ActiveRecord::Migration
  def change
    create_table :group_relationships do |t|
      t.integer :base_group_id
      t.integer :derived_group_id

      t.timestamps
    end
  end
end
