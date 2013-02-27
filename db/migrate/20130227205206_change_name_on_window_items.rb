class ChangeNameOnWindowItems < ActiveRecord::Migration
  def change
   change_column :window_items, :name, :string, :null => false, :limit => 32
  end
end
