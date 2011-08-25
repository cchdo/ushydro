# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
    # Flash messages block
  def flash_messages
    flash_html = ''
    [:notice, :warning, :message].each do |msg_type|
      if flash[msg_type]
        flash_html = flash_html + "<div class=\"#{msg_type}\">#{flash[msg_type]}</div>"
      end
      flash[msg_type] = nil;
    end
    flash_html
  end

end
