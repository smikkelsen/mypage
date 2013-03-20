ActiveAdmin.register WindowItem do

  # ======================= PERMISSIONS =======================
  menu :priority => 10, :parent => 'Windows'
  # ===================== BATCH ACTIONS =====================

  active_admin_importable

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

  action_item :only => :show do
    link_to 'Build Defaults', build_defaults_admin_window_item_path(window_item)
  end

  member_action :build_defaults do
    environments = [
        { :name => 'Dev', :font_color => '#3F4F26' },
        { :name => 'Beta', :font_color => '#3F4F26' },
        { :name => 'Prod', :font_color => '#3F4F26' },
    ]

    environments.each do |env|
      Rails.logger.debug '========================='
      Rails.logger.debug env[:name]
    end
    #user = WindowItem.find(params[:id])
    #parent = WindowItem.find(params[:id])
    #dev = WindowItem.new(:parent_window_item_id => parent.id, :name => 'Dev', :position => 1, :font_color => '#3F4F26', :children_layout => 'list-vertical')
    #beta = WindowItem.new(:parent_window_item_id => parent.id, :name => 'Beta', :position => 2, :font_color => '#273869', :children_layout => 'list-vertical')
    #prod = WindowItem.new(:parent_window_item_id => parent.id, :name => 'Prod', :position => 3, :font_color => '#571313', :children_layout => 'list-vertical')
    #
    #dev.save!
    #beta.save!
    #prod.save!
    #
    #admin = WindowItem.new(:parent_window_item_id => parent.id, :name => 'Prod', :position => 3, :font_color => '#571313', :children_layout => 'list-vertical')
    #cms = WindowItem.new(:parent_window_item_id => parent.id, :name => 'Prod', :position => 3, :font_color => '#571313', :children_layout => 'list-vertical')
    #public = WindowItem.new(:parent_window_item_id => parent.id, :name => 'Prod', :position => 3, :font_color => '#571313', :children_layout => 'list-vertical')
    #public_root = WindowItem.new(:parent_window_item_id => parent.id, :name => 'Prod', :position => 3, :font_color => '#571313', :children_layout => 'list-vertical')
    #root = WindowItem.new(:parent_window_item_id => parent.id, :name => 'Prod', :position => 3, :font_color => '#571313', :children_layout => 'list-vertical')
    #

    redirect_to admin_window_item_path(), :notice => 'Defaults Added!'
  end

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
      row 'Font Color' do |a|
        span '', :style => "background-color: #{a.font_color}; padding-left: 12px; margin-right: 10px;"
        span a.font_color
      end
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

            column '' do |a|
              crud_links a, WindowItem
            end
          end

        end
      end
    end # end accordion

  end

# =========================== EDIT ==========================
  form do |f|
    f.inputs "Window Details" do
      f.input :window
      f.input :parent_window_item
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
        #a.input :window_id, :as => :hidden, :value => window_item.window_id
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
