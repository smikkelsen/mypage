class CreateWindowItems < ActiveRecord::Migration
  def change
    create_table :window_items do |t|
      t.integer :parent_window_item_id
      t.integer :window_id, :null => false
      t.string :children_layout, :default => 'landscape'
      t.string :name, :null => false, :limit => 32
      t.string :hover_text
      t.integer :icon_id
      t.string :link
      t.boolean :active
      t.integer :position, :limit => 3, :null => false

      t.timestamps
    end
    add_index :window_items, :parent_window_item_id
    add_index :window_items, :icon_id
    add_index :window_items, :active
    add_index :window_items, :position

  end
end
