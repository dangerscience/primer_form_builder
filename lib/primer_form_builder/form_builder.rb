# frozen_string_literal: true

module PrimerFormBuilder
  ##
  # The Builder class is used by Rails to build forms with Primer markup.
  #
  # It should be passed as the +builder:+ argument to a +form_with+ method, i.e.
  # +form_with builder: PrimerFormBuilder::Builder+.
  class Builder < ::ActionView::Helpers::FormBuilder
    delegate :tag, :safe_join, :capture, to: :@template
    alias plain_label label

    def sr_label(name, *args)
      options = args.extract_options!
      options[:class] = [options[:class], :'sr-only']
      plain_label(name, *(args << options))
    end

    def label(name, *args)
      tag.div super(name, *args), class: :'form-group-header'
    end

    def text_field(name, *args)
      options = args.extract_options!
      options[:class] = [options[:class], :'form-control']
      super(name, *(args << options))
    end

    def email_field(name, *args)
      options = args.extract_options!
      options[:class] = [options[:class], :'form-control']
      super(name, *(args << options))
    end

    def url_field(name, *args)
      options = args.extract_options!
      options[:class] = [options[:class], :'form-control']
      super(name, *(args << options))
    end

    def number_field(name, *args)
      options = args.extract_options!
      options[:class] = [options[:class], :'form-control']
      super(name, *(args << options))
    end

    def telephone_field(name, *args)
      options = args.extract_options!
      options[:class] = [options[:class], :'form-control']
      super(name, *(args << options))
    end

    def password_field(name, *args)
      options = args.extract_options!
      options[:class] = [options[:class], :'form-control']
      super(name, *(args << options))
    end

    def text_area(name, *args)
      options = args.extract_options!
      options[:class] = [options[:class], :'form-control']
      super(name, *(args << options))
    end

    def datetime_select(method, options = {}, html_options = {})
      html_options[:class] = [html_options[:class], :'form-select']
      super(method, options, html_options)
    end

    def check_box_single(name, *args)
      cb = check_box(name, *(args << options))
      cb << human_name(name)
      tag.div tag.label(cb), class: "form-checkbox"
    end

    def note(content, *args)
      options = args.extract_options!
      options[:class] = [options[:class], :note]
      tag.p content, **options
    end

    def submit(label = nil, *args)
      options = args.extract_options!
      options[:class] = %w[btn btn-primary] if options[:class].blank?
      super(label, *(args << options))
    end

    def button(label = nil, *args)
      options = args.extract_options!
      options[:class] = if options[:type].nil? || options[:type] == :submit
                          [options[:class], :btn, :'btn-primary']
                        else
                          [options[:class], :btn]
                        end
      super(label, *(args << options))
    end

    def group(field = nil, *args, &block)
      options = args.extract_options!
      options[:class] = %w[form-group]
      options[:class] << "errored" if errored?(field)
      tag.div(**options) do
        safe_join [
          capture(&block),
          error_note(field)
        ].compact
      end
    end

    def error_note(field)
      return unless errored?(field)

      tag.p(@object.errors[field].join(", "), class: %i[note error])
    end

    def errored?(field)
      return false unless @object.respond_to?(:errors)

      @object.errors.key?(field)
    end

    private

    def human_name(attribute)
      if @object.class.respond_to?(:human_attribute_name)
        @object.class.human_attribute_name attribute
      else
        I18n.t(:"activerecord.attributes.#{@object_name}.#{attribute}", default: attribute.to_s.humanize)
      end
    end
  end
end
