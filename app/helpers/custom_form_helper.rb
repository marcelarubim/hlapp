# .nodoc. #
module CustomFormHelper
  def custom_form_for(name, *args, &block)
    options = args.extract_options!
    form_for(name, *(args << options.merge(builder: CustomFormBuilder)), &block)
  end

  def select_tag(name, option_tags = nil, options = {})
    super(name, option_tags, field_options(options))
  end

  def label_tag(name = nil, content_or_options = nil, options = {}, &block)
    super(name, content_or_options, label_options(options, 'col-sm-2 text-right'), &block)
  end

  private

  def field_options(options = {})
    options[:class] = [options[:class] || '', 'form-control form-control-sm']
                      .reject(&:empty?).join(' ')
    options.delete(:col)
    options
  end

  def label_options(options = {}, optional = '')
    options[:class] = [options[:class] || '',
                       'col-form-label col-form-label-sm',
                       optional]
                      .reject(&:empty?).join(' ')
    options.delete(:col)
    options
  end
end
