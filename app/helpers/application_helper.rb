# .nodoc. #
module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'HL'
    if page_title.empty?
      base_title
    else
      base_title + ' | ' + page_title.downcase
    end
  end

  def show_errors(object, field_name)
    return unless object.errors.any? || !object.errors.messages[field_name].blank?
    object.errors.messages[field_name].join(', ')
  end
end
