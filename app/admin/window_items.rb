ActiveAdmin.register WindowItem do

  # ======================= PERMISSIONS =======================
  menu :priority => 10, :parent => 'Windows'
  # ===================== BATCH ACTIONS =====================


  # ========================= FILTERS =========================
  filter :page
  filter :name
  filter :link
  filter :active, :as => :select
  filter :hover_text
  filter :type
  filter :window_id, :as => :select


  # ========================== INDEX ==========================
  index do
    selectable_column
    column :name
    column :active
    column :link
    column :icon
    column :window

    default_actions
  end

  # ========================= DETAILS =========================

  show :title => :name do

    attributes_table do
      row :window
      #row :parent_window_item
      row "Parent Item" do |a|
        if a.parent_window_item_id.nil?
          ""
        else
          link_to WindowItem.find_by_id(a.parent_window_item_id).name, admin_window_item_path(a.parent_window_item_id)
        end
      end
      row :name
      row :position
      row :link
      row :hover_text
      row :active
      row :icon
      row :children_layout
      row :created_at
      row :updated_at
    end

    div :class => "accordion" do
      if window_item.child_items.count > 0
        panel "Window Items (#{window_item.child_items.count})" do

          table_for window_item.child_items do
            column "Name" do |a|
              link_to a.name, admin_window_item_path(a.id)
            end
            column :active
            column :link
            column :icon
            column :window
          end

        end
      end
    end # end accordion

  end

# =========================== EDIT ==========================
  form do |f|
    f.inputs "Window Details" do
      f.input :window
      f.input :name
      f.input :position
      f.input :link
      f.input :font_color
      f.input :hover_text
      f.input :active
      f.input :icon_id, :as => :select, :collection => Icon.all.select
      f.input :children_layout, :as => :select, :collection => WindowItem::CHILDREN_LAYOUT_OPTIONS


      f.buttons
    end

    f.inputs "Sub Items" do
      f.has_many :child_items do |a|
        a.input :window_id, :as => :hidden, :value => window_item.window_id
        a.input :name
        a.input :position
        a.input :link
        a.input :font_color
        a.input :hover_text
        a.input :active
        a.input :icon_id, :as => :select, :collection => Icon.all.select
        a.input :children_layout, :as => :select, :collection => WindowItem::CHILDREN_LAYOUT_OPTIONS
      end
      f.buttons

    end

  end

end
