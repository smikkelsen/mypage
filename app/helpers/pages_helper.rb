require 'enumerator' # for in_groups_of method
module PagesHelper
  def get_windows(page_id, column_position)
    text = ''
    windows = Window.by_page(page_id).by_column(column_position).active.order('page_position, name ASC')


    windows.each do |window|
      case window.window_type
        when 'default'
          text += get_default_window(window)
        when 'directory'

        when 'search_all'

        when 'google_search'
          text += get_search_bar_window
        else

      end
    end
    text.html_safe
  end

end
