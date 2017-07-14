# .nodoc. #
class CustomFormBuilder < ActionView::Helpers::FormBuilder
  include CustomFormHelper

  def self.custom_literal_field(method_name)
    define_method(method_name) do |attribute, *args, &block|
      options = args.extract_options!
      @template.content_tag(:div, class: options[:col] || 'col-sm-4') do
        super(attribute, *(args << field_options(options)), &block)
      end
    end
  end

  def label(attribute, *args, &block)
    options = args.extract_options!
    @template.content_tag(:div, class: options[:col] || 'col-sm-2' + ' text-right') do
      super(attribute, *(args << label_options(options)), &block)
    end
  end

  def collection_select(method, collection, value_method, text_method, options = {}, html_options = {})
    @template.content_tag(:div, class: html_options[:col] || 'col-sm-4') do
      super(method, collection, value_method, text_method, options,
            field_options(options))
    end
  end

  def select(method, choices, options = {}, html_options = {})
    @template.content_tag(:div, class: options[:col] || 'col-sm-4') do
      super(method, choices, options, field_options(html_options))
    end
  end

  field_helpers.each do |method_name|
    if method_name.to_s == 'text_area' ||
       method_name.to_s.include?('_field')
      custom_literal_field(method_name)
    end
  end
end
