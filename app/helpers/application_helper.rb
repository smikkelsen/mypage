module ApplicationHelper
  def render_icon(icon_id, height, styles = '')
    icon = Icon.find_by_id(icon_id)
    image_tag "data:image/jpeg;base64,#{icon.value}", :style => "max-height: #{height}px; #{styles}".html_safe unless icon.nil?
  end
end
