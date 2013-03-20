module ActiveAdmin::ViewsHelper

  def crud_links(resource, model)

    model_name = model.name
    table_name = model_name.tableize.singularize
    human_readable = table_name.humanize
    path = "admin_#{table_name}_path"

    link = []
    link << link_to("View", eval("#{path}(#{resource.id})"))
    link << link_to("Edit", eval("edit_#{path}(#{resource.id})"))
    link << link_to("Delete", eval("#{path}(#{resource.id})"), :method => :delete, :confirm => "Are you sure you want to permanently delete this #{human_readable}?")
    link.join("&nbsp;&nbsp;").html_safe
  end

  def new_button(model)

    model_name = model.name
    table_name = model_name.tableize.singularize
    human_readable = table_name.humanize
    path = "admin_#{table_name}_path"

    if can?(:create, model)
      link_to("New #{human_readable}", eval("new_#{path}()"))
    end
  end

  def edit_button(resource_id, model)
    model_name = model.name
    table_name = model_name.tableize.singularize
    path = "admin_#{table_name}_path"
    if can?(:edit, model)
      link_to("Edit", eval("edit_#{path}(#{resource_id})"))
    end
  end

  def delete_button(resource_id, model)
    model_name = model.name
    table_name = model_name.tableize.singularize
    human_readable = table_name.humanize
    path = "admin_#{table_name}_path"

    if can?(:destroy, model)
      link_to("Delete", eval("#{path}(#{resource_id})"), :method => :delete, :confirm => "Are you sure you want to permanently delete this #{human_readable}?")
    end
  end

end