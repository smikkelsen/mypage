class ChangeWindowIdOnWindowItems < ActiveRecord::Migration
  def change
    change_column :window_items, :window_id, :integer, :null => true
  end
end
