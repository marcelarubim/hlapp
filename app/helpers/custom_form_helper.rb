# .nodoc. #
module CustomFormHelper
  def custom_form_for(name, *args, &block)
    options = args.extract_options!
    form_for(name, *(args << options.merge(builder: CustomFormBuilder)), &block)
  end

  def select_tag(name, option_tags = nil, options = {})
    options[:class] = [options[:class] || '', 'form-control form-control-sm']
                      .reject(&:empty?).join(' ')
    super(name, option_tags, options)
  end

  def label_tag(name = nil, content_or_options = nil, options = nil, &block)
    options[:class] = [options[:class] || '',
                       'col-form-label col-form-label-sm text-right']
                      .reject(&:empty?).join(' ')
    super(name, content_or_options, options, &block)
  end
end
