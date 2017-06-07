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

  def pluralize_without_count(count, noun, text = nil)
    return if count.zero?
    count == 1 ? "#{noun}#{text}" : "#{noun.pluralize}#{text}"
  end

  def link_to_add_fields(text, f, child, partial = nil, options = {})
    path = f.instance_values['object_name'].to_s + "[#{child}_attributes]"
    parent = f.object.class.name
    partial ||= "#{pluralize_without_count(2, parent.downcase)}/#{child}"
    link_to(text, add_object_path(child: child, path: path,
                                  partial: partial, target: options[:target]),
            remote: true, id: 'add-object')
  end
end
