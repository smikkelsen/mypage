ActiveAdmin.register Icon do

  # ======================= PERMISSIONS =======================
  menu :priority => 40
  # ===================== BATCH ACTIONS =====================

  active_admin_importable
  # ========================= FILTERS =========================
  filter :name
  filter :value

  action_item :only => [:show] do
      link_to("New Icon", new_admin_icon_path())
  end
  # ========================== INDEX ==========================
  index do
    selectable_column
    column 'image' do |a|
      image_tag "data:image/jpeg;base64,#{a.value}", :style=>"max-height: 30px;"
    end
    column :name
    default_actions
  end

  # ========================= DETAILS =========================

  show :title => :name do

    attributes_table do
      row :name
      row "image" do |a|
        image_tag "data:image/jpeg;base64,#{a.value}", :style=>"max-height: 80px;"
      end
      row :created_at
      row :updated_at
    end

  end

  # =========================== EDIT ==========================
  form do |f|
    f.inputs "Window Details" do
      f.input :name
      f.input :value

      f.buttons
    end

  end

end
