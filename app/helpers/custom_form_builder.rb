# .nodoc. #
class CustomFormBuilder < ActionView::Helpers::FormBuilder
  include CustomFormHelper
  # delegate :capture, :content_tag, :tag, to: :@template

  def self.error_tagged(method_name)
    define_method(method_name) do |attribute, *args, &block|
      options = args.extract_options!
      label_class = options[:class]
      custom_label = options[:label] || attribute.to_s.humanize
      # label_class = options[:label_class].to_s + 'col-form-label' + 'col-form-label-sm' +
                    # 'text-right'

      # @template.content_tag(:div, { class: 'field', id: "field-#{attribute}" }) do
      #   @template.content_tag(:label, custom_label, class: label_class) +
      #     @template.content_tag(:div, super(label, *(args << options), &block))
      # end

      # placeholder = (options[:placeholder]) || attribute

      # if object.errors[attribute].any?
      #   label_class = label_class.to_s + ' text-danger'
      #   data_toggle = 'tooltip-' + attribute.to_s
      #   id = 'tooltip-' + attribute.to_s
      #   data_place = 'bottom'
      #   errors = object.errors[attribute].join(', ')
      #   placeholder = placeholder.to_s + ' *'
      # end

      # placeholder = placeholder.to_s.downcase
      # super(attribute,
      #       *(args << options.merge(class: label_class,
      #                               placeholder: placeholder,
      #                               'data-toggle': data_toggle,
      #                               'data-placement': data_place, id: id, title: errors)),
      #       &block
      # )
    end
  end

  def self.custom_literal_field(method_name)
    define_method(method_name) do |attribute, *args, &block|
      options = args.extract_options!
      @template.content_tag(:div, class: options[:col] || 'col-sm-4') do
        super(attribute, *(args << field_options(options)), &block)
      end
    end
  end

  def label(attribute, *args, &block)
    super(attribute, *(args << label_options(args.extract_options!)), &block)
  end

  def collection_select(method, collection, value_method, text_method, options = {}, html_options = {})
    super(method, collection, value_method, text_method, options,
          field_options(html_options))
  end

  field_helpers.each do |method_name|
    # error_tagged(method_name)
    if method_name.to_s == 'text_area' ||
       method_name.to_s.include?('_field')
      custom_literal_field(method_name)
    end
  end

  # def field_wrapper(attribute, args, &block)
  #   @template.content_tag(:div, { class: 'field', id: "field-#{attribute}" }) do
  #     @template.content_tag(:ul, '', class: 'errorlist') +
  #     @template.content_tag(:div, class: 'field-wrapper') do
  #       @template.content_tag(:div, '', class: 'indicator') +
  #       block.call
  #     end
  #   end
  # end

  # private

  # def with_errors
  # end

  # def self.field_wrapper(method_name)
  #   define_method(method_name) do |name, *args, &block|
  #     @template.content_tag(:div, { class: 'field', id: "field-#{method_name}" }) do
  #       @template.content_tag(:ul, '', class: 'errorlist') +
  #       @template.content_tag(:div, class: 'field-wrapper') do
  #         @template.content_tag(:div, '', class: 'indicator') + block.call
  #       end
  #     end
  #   end
  # end


  # def submit(label, *args)
  #   options = args.extract_options!
  #   new_class = options[:class] || "button"
  #   super(label, *(args << options.merge(:class => new_class)))
  # end
end
