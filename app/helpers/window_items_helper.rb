module WindowItemsHelper

  def aa_flyout(item, parent_layout)
    text = ''
    if item.link.empty? || item.link.nil?
      text += "<div class='#{parent_layout} window-item-parent aa_flyout button clickable' style='#{set_color(item.font_color)}'>#{item.name}\r\n"

      sub_items = WindowItem.by_parent(item.id).active.active.order('position, name ASC')
      unless sub_items.count < 1
        text += "  <div class='dropdown_menu_list_wrapper' style='display: none; '>\r\n"
        text += link_to (image_tag 'settings_lt.png', :class => 'settings flt-rt', :width => '15px'), admin_window_item_path(item.id), :target => '_blank'
        text += "    <ul class='dropdown_menu_list'>\r\n"
        sub_items.each do |sub|
          Rails.logger.error 'Something weird here?'
          Rails.logger.debug sub.inspect
          text += "      <li #{hover_text_if(sub.hover_text)} class='#{item.children_layout} #{hover_class_if(sub.hover_text)} '>\r\n"
          text += aa_flyout(sub, item.children_layout)
          text += "      </li>\r\n"
        end
        text += "    </ul>\r\n"
        text += "  </div>\r\n"
      end
      text += "</div>\r\n"

    else
      #text += link_to "<div class='#{parent_layout} window-item-parent aa_flyout button clickable'>#{item.name}", item.link
      text += "<a class='category_link' href='#{item.link}'><div class='#{set_color(item.font_color)} #{parent_layout} window-item-parent aa_flyout button_link clickable'>#{item.name}</div></a>\r\n"
    end

  end

end