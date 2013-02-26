class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name, :null => false, :limit => 64
      t.integer :column_1_count, :null => false, :default => 1
      t.integer :column_2_count, :null => false, :default => 1
      t.integer :column_3_count, :null => false, :default => 1
      t.integer :column_4_count, :null => false, :default => 1
      t.integer :column_5_count, :null => false, :default => 1
      t.integer :column_6_count, :null => false, :default => 1
      t.integer :position, :limit => 3, :null => false
      t.boolean :active, :default => true
      t.boolean :default, :default => false

      t.timestamps
    end
    add_index :pages, :active

  end
end
