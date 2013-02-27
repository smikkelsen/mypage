module WindowItemsHelper

  def aa_flyout(item, parent_layout)
    text = ''
    if item.link.empty?
      text += "<div class='#{parent_layout} window-item-parent aa_flyout button clickable'>#{item.name}"

      sub_items = WindowItem.by_parent(item.id).active
      unless sub_items.nil?
        text += '  <div class="dropdown_menu_list_wrapper" style="display: none; ">'
        text += '    <ul class="dropdown_menu_list">'
        sub_items.each do |sub|
          text += "      <li #{hover_text_if(sub.hover_text)} class='#{item.children_layout} #{hover_class_if(sub.hover_text)} '>"
          text += aa_flyout(sub, item.children_layout)
          text += '      </li>'
        end
        text += '    </ul>'
        text += '  </div>'
      end
    else
      text += "<div class='#{parent_layout} window-item-parent aa_flyout button clickable'><a class='category_link' href='#{item.link}'>#{item.name}</a>"
    end

    text += '</div>'

  end


end