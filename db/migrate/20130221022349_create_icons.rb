class CreateIcons < ActiveRecord::Migration
  def change
    create_table :icons do |t|
      t.string :name, :null => false, :limit => 32
      t.text :value, :null => false

      t.timestamps
    end
  end
end
