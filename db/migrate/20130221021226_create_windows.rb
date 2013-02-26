class CreateWindows < ActiveRecord::Migration
  def change
    create_table :windows do |t|
      t.string :name, :limit => 64, :null => false, :uniqueness => true
      t.integer :page_id, :null => false
      t.integer :page_position, :null => false
      t.string :window_type, :limit => 32, :null => false
      t.integer :column_count, :null => false
      t.integer :column_position, :null => false
      t.integer :icon_id
      t.boolean :collapsible
      t.boolean :active

      t.timestamps
    end
    add_index :windows, :page_id
    add_index :windows, :icon_id
    add_index :windows, :active
  end
end
