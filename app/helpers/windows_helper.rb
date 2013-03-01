module WindowsHelper

  def get_search_bar_window
    text = ''
    text += "<div style='margin:6px 0px' >\r\n"
    text += "<form id='google-search'>\r\n"
    text += "<input type='text' class='input' id='search_string' name='search_string' tabindex='1' >"
    text += "<button id='gbqfba' class='submit_button' aria-label='Google Search' name='btnK' style='margin:0' >Google Search</button>\r\n"
    text += "</form>\r\n"
    text += "</div>\r\n"
  end

  def get_default_window(window)
    text = ''

    text += "<div class='panel'>\r\n"

    text += "  <div class='panel-insert'>\r\n"

    text += "    <table class='panel-insert-table'>\r\n"
    text += "      <tr class='panel-heading'>\r\n"
    text += "        <td colspan=#{window.column_count}>#{render_icon(window.icon_id, 25, styles = 'float:left; padding: 5px;')}\r\n"
    text += "          <h2>#{window.name}"
    text += link_to (image_tag 'settings_dk.png', :class => 'flt-rt', :width => '20px'), admin_window_path(window.id), :target => '_blank'

    text += "</h2></td>\r\n"

    text += "      </tr>\r\n"

    text += "      <tr class='panel-body'>\r\n"

    text += "        <td valign='top'>\r\n"

    text += "          <table>\r\n"

    window_items = WindowItem.by_window(window.id).is_parent.active.active.order('position, name ASC')
    window_items.in_groups_of(window.column_count) do |row|
      text += "            <tr class='searchable'>\r\n"
      row.each do |item|
        text += "              <td class='items-col'>\r\n"

        unless item.nil?


          text += "                #{render_icon(item.icon_id, 18, styles = 'padding-right:5px;')}<span #{hover_text_if(item.hover_text)} class='#{hover_class_if(item.hover_text)}'>#{link_to_unless item.link.empty?, item.name, item.link rescue '' }</span>\r\n"
          text += "              </td>\r\n"
          sub_items = WindowItem.by_parent(item.id).active.active.order('position, name ASC')
          unless sub_items.nil?
            text += "              <td class='sub-items-col'>\r\n"
            sub_items.each do |sub|
              text += aa_flyout(sub, item.children_layout)
            end
            text += "              </td>\r\n"
          end

        end

      end # End Column
      text += "            </tr>\r\n"


    end # End Row
    text += "          </table>\r\n"

    text += "        </td>\r\n"

    text += "      </tr>\r\n"

    text += "    </table>\r\n"
    text += "  </div>\r\n"
    text += "</div>\r\n"


    return text
  end

  def hover_text_if(text)
    "title='#{text}'" unless text.empty? || text.nil?
  rescue
    ''
  end

  def hover_class_if(text)
    ' tooltip ' unless text.empty? || text.nil?
  rescue
    ''
  end

end