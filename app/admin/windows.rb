ActiveAdmin.register Window do

  # ======================= PERMISSIONS =======================
  menu :priority => 20
  # ===================== BATCH ACTIONS =====================

  active_admin_importable

  # ========================= FILTERS =========================
  filter :name
  filter :page
  filter :collapsible, :as => :select
  filter :icon_id, :as => :select
  filter :active, :as => :select
  filter :page_position

  # ======================== SIDE BARS ========================

  sidebar :actions, :only => :show do
    test = ''
    test += button_to 'Add Default Site', add_default_site_admin_window_path(window), :method => :get
    test += '<br>'
    test.html_safe
  end

  # ========================= DETAILS =========================

  #action_item :only => :show do
  #  link_to 'Build Defaults', build_defaults_admin_window_item_path(window_item)
  #end

  member_action :add_default_site, :method => :get do
    environments = [
        {:name => 'Dev', :font_color => '#3F4F26', :host => 'http://localhost.com:3000'},
        {:name => 'Beta', :font_color => '#273869', :host => 'http://beta.example.com'},
        {:name => 'Prod', :font_color => '#571313', :host => 'http://example.com'},
    ]
    window = Window.find(params[:id])

    main = WindowItem.new(:window_id => window.id, :name => 'New Window Item', :position => 1, :children_layout => 'list-horizontal')
    main.save!
    environments.each do |env|
      parent = WindowItem.new(:parent_window_item_id => main.id, :name => env[:name], :position => 1, :font_color => env[:font_color], :children_layout => 'list-vertical')
      parent.save!

      admin = WindowItem.new(:parent_window_item_id => parent.id, :name => 'Admin', :position => 1, :font_color => '', :children_layout => 'list-vertical', :link => "#{env[:host]}/admin")
      admin.save!
      cms = WindowItem.new(:parent_window_item_id => parent.id, :name => 'CMS', :position => 2, :font_color => '', :children_layout => 'list-vertical', :link => "#{env[:host]}/cms-admin")
      cms.save!
      public = WindowItem.new(:parent_window_item_id => parent.id, :name => 'Public', :position => 3, :font_color => '', :children_layout => 'list-vertical')
      public.save!
      public_root = WindowItem.new(:parent_window_item_id => public.id, :name => 'Root', :position => 1, :font_color => '', :children_layout => 'list-vertical', :link => env[:host])
      public_root.save!
      root = WindowItem.new(:parent_window_item_id => parent.id, :name => 'Root', :position => 4, :font_color => '', :children_layout => 'list-vertical', :link => env[:host])
      root.save!

    end

    redirect_to admin_window_path(window.id), :notice => 'Defaults Added!'
  end

  # ========================== INDEX ==========================
  index do
    #selectable_column
    column :name
    column :column_position
    column :page_position
    column :window_type
    column :active
    column :collapsible
    column :icon_id

    default_actions
  end

  # ========================= DETAILS =========================

  show :title => :name do

    attributes_table do
      row :name
      row :column_position
      row :window_type
      row :column_count
      row :active
      row :page_position
      row :collapsible
      row :icon_id
      row :created_at
      row :updated_at
    end

    div :class => "accordion" do
      if window.window_items.is_parent.count > 0
        panel "Window Items (#{window.window_items.is_parent.count})" do

          table_for window.window_items.is_parent do
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
      f.input :page
      f.input :name
      f.input :window_type, :as => :select, :collection => Window::WINDOW_TYPES,
              :input_html => {:class => 'autoComplete'}, :include_blank => false
      f.input :column_count, :as => :select, :collection => Window::NUM_COLUMNS,
              :input_html => {:class => 'autoComplete'}
      f.input :column_position, :as => :select, :collection => Window::COLUMNS,
              :input_html => {:class => 'autoComplete'}
      f.input :icon_id, :as => :select, :collection => Icon.all.select
      f.input :active, :as => :boolean
      f.input :page_position
      f.input :collapsible, :as => :boolean

      f.buttons
    end

    f.inputs "Window Items" do
      f.has_many :window_items do |a|
        #a.input :window_id, :as => :hidden, :value => window_item.window_id
        a.input :name
        a.input :position
        a.input :link
        a.input :hover_text
        a.input :active, :as => :boolean
        a.input :icon_id, :as => :select, :collection => Icon.all.select
        a.input :children_layout, :as => :select, :collection => WindowItem::CHILDREN_LAYOUT_OPTIONS


        #f.input :window
        #f.input :position
        #f.input :name
        #f.input :link
        #f.input :hover_text
        #f.input :active
        #f.input :icon_id, :as => :select, :collection => Icon.all.select

      end
      f.buttons
    end

  end

end
