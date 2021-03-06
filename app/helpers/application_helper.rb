module ApplicationHelper
  def inform_validation_error(obj)
    html_text = ''
    obj.errors.full_messages.each do |message|
      html_text += content_tag(:div, class: 'alert alert-danger') do
        content_tag(:a, 'x', data: { dismiss: 'alert' })
        message
      end
    end
    raw(html_text)
  end
end
