class AddColorToWindowItems < ActiveRecord::Migration
  def change
    add_column :window_items, :font_color, :string
  end
end
