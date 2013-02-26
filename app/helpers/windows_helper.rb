module WindowsHelper

  def get_search_bar_window
    text = ''
    text += '<div style="margin:6px 0px" >'
    text += '<form id="google-search">'
    text += "<input type='text' class='input' id='search_string' name='search_string' tabindex='1' >"
    text += "<button id='gbqfba' class='submit_button' aria-label='Google Search' name='btnK' style='margin:0' >Google Search</button>"
    text += '</form>'
    text += '</div>'
  end

  def get_default_window(window)
    text = ''

    text += '<div class="panel">'
    text += '  <div class="panel-insert">'
    text += '    <table class="panel-insert-table">'
    text += '      <tr class="panel-heading">'
    text += "        <td colspan=#{window.column_count}>#{render_icon(window.icon_id, 25, styles = 'float:left; padding: 5px;')}"
    text += "          <h2>#{window.name}</h2></td>"
    text += '      </tr>'

    window_items = WindowItem.by_window(window.id).is_parent.active
    window_items.in_groups_of(window.column_count) do |row|
      text += '      <tr class="panel-body">'

      row.each do |item|
        text += '        <td valign="top">'

        unless item.nil?

          text += '          <table>'
          text += '            <tr class="searchable">'

          text += '              <td>'
          text += "                #{render_icon(item.icon_id, 18, styles = 'padding-right:5px;')}<span #{hover_text_if(item.hover_text)} class='#{hover_class_if(item.hover_text)}'>#{link_to_unless item.link.empty?, item.name, item.link }</span>"
          text += '              </td>'
          sub_items = WindowItem.by_parent(item.id).active
          unless sub_items.nil?
            text += '              <td>'
            sub_items.each do |sub|
              text += aa_flyout(sub, item.children_layout)
            end
            text += '              </td>'
          end

          text += '            </tr>'
          text += '          </table>'
        end
        text += '        </td>'

      end # End Column
      text += '      </tr>'


    end # End Row


    text += '    </table>'
    text += '  </div>'
    text += '</div>'


    return text
  end

  def hover_text_if(text)
    "title='#{text}'" unless text.empty?
  end

  def hover_class_if(text)
    ' tooltip ' unless text.empty?
  end
end