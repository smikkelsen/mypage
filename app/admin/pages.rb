ActiveAdmin.register Page do
  # ======================= PERMISSIONS =======================
  menu :priority => 10
  # ===================== BATCH ACTIONS =====================


  # ========================= FILTERS =========================
  filter :name
  filter :position
  filter :active
  filter :default
  # ========================== INDEX ==========================
  index do
    #selectable_column
    column :name
    column :position
    column :active
    column :default
    column :column_1_count
    column :column_2_count
    column :column_3_count
    column :column_4_count
    column :column_5_count
    column :column_6_count


    default_actions
  end

  # ========================= DETAILS =========================

  show :title => :name do

    attributes_table do
      row :name
      row :position
      row :active
      row :default
      row :column_1_count
      row :column_2_count
      row :column_3_count
      row :column_4_count
      row :column_5_count
      row :column_6_count
      row :created_at
      row :updated_at
    end

    #div :class => "accordion" do
    #  if site.site_attributes.count > 0
    #    panel "Site Attributes (#{site.site_attributes.count})" do
    #
    #      table_for site.site_attributes do
    #
    #        column "Name" do |a|
    #          link_to a.name, site_attribute_path(a.id)
    #        end
    #        column :value
    #
    #      end
    #
    #    end
    #  end
    #end # end accordion

  end


  #sidebar :columns, :only => [:new, :edit] do
  #  div :id => 'category_bucket' do
  #    #6.times do
  #    #  div :class => 'droppable_category', :value => '1' do
  #    #    'column'
  #    #  end
  #    #end
  #    div :class => 'droppable_category', :value => '1' 'data-input = \'column_1_count\' ' do
  #      'column'
  #    end
  #    div :class => 'droppable_category', :value => '1' do
  #      'column'
  #    end
  #    div :class => 'droppable_category', :value => '1' do
  #      'column'
  #    end
  #    div :class => 'droppable_category', :value => '1' do
  #      'column'
  #    end
  #    div :class => 'droppable_category', :value => '1' do
  #      'column'
  #    end
  #    div :class => 'droppable_category', :value => '1' do
  #      'column'
  #    end
  #  end
  #
  #
  #
  #  br :class => 'clear'
  #  div :id => 'column_1_bucket', :class => 'droppable_bucket' do
  #  end
  #  div :id => 'column_2_bucket', :class => 'droppable_bucket' do
  #  end
  #  div :id => 'column_3_bucket', :class => 'droppable_bucket' do
  #  end
  #  div :id => 'column_4_bucket', :class => 'droppable_bucket' do
  #  end
  #  div :id => 'column_5_bucket', :class => 'droppable_bucket' do
  #  end
  #  div :id => 'column_6_bucket', :class => 'droppable_bucket' do
  #  end
  #end


  # =========================== EDIT ==========================
  form :partial => 'form'
  #form do |f|
  #  f.inputs "Page Details" do
  #    f.input :name
  #
  #    #f.input :column_1_count, :as => :range,
  #    #        :in => (0..6),
  #    #        :step => 1,
  #    #        :input_html => {:class => 'column_slider'}
  #    #f.input :column_2_count, :as => :range,
  #    #        :in => (0..6),
  #    #        :step => 1,
  #    #        :input_html => {:class => 'column_slider'}
  #    #f.input :column_3_count, :as => :range,
  #    #        :in => (0..6),
  #    #        :step => 1,
  #    #        :input_html => {:class => 'column_slider'}
  #    #f.input :column_4_count, :as => :range,
  #    #        :in => (0..6),
  #    #        :step => 1,
  #    #        :input_html => {:class => 'column_slider'}
  #    #f.input :column_5_count, :as => :range,
  #    #        :in => (0..6),
  #    #        :step => 1,
  #    #        :input_html => {:class => 'column_slider'}
  #    #f.input :column_6_count, :as => :range,
  #    #        :in => (0..6),
  #    #        :step => 1,
  #    #        :input_html => {:class => 'column_slider'}
  #    f.input :position
  #    f.input :active
  #
  #    f.buttons
  #
  #    f.input :column_1_count, :as => :hidden
  #    f.input :column_2_count, :as => :hidden
  #    f.input :column_3_count, :as => :hidden
  #    f.input :column_4_count, :as => :hidden
  #    f.input :column_5_count, :as => :hidden
  #    f.input :column_6_count, :as => :hidden
  #  end
  #
  #
  #end

end
