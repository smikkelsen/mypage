class ChangeActiveOnWindowItems < ActiveRecord::Migration
  def change
    change_column :window_items, :active, :boolean, :default => true
  end
end
