module Formtastic

  if defined?(ActiveSupport::CoreExtensions)
	  DATE_FORMATS = ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS
  else
	  DATE_FORMATS = Date::DATE_FORMATS
  end

  module DatePicker

  protected

    def datepicker_input(method, options = {})
      format = options[:format] || I18n.t('date.formats')[:default] || DATE_FORMATS[:default] || '%d %b %Y'
      clss = []
      inp_opts = options.delete(:input_html) || {}
      clss << inp_opts.delete(:class).to_s
      clss << options.delete(:class).to_s
      options[:input_html] = {:class => "ui-datepicker " + clss.join(' ')}.merge inp_opts
      options[:input_html][:value] = object.send(method).strftime("%d.%m.%Y") unless object.send(method).nil?
      label_options = options_for_label(options)
      label_options[:for] ||= options[:id]
      options = options.delete(:input_html) || {}
      options = default_string_options(method, type).merge(html_options) if [:numeric, :string, :password, :text, :phone, :search, :url, :email].include?(type)
      field_id = generate_html_id(method, "")
      options[:id] ||= field_id
      label(method, label_options) << send(:text_field, method, options)
    end

  end

  module DateTimePicker

  protected

    def datetimepicker_input(method, options = {}, value = nil)
      format = options[:format] || I18n.t('time.formats')[:default] || DATE_FORMATS[:default] ||  '%d %b %Y %H:%M'
      clss = []
      inp_opts = options.delete(:input_html) || {}
      clss << inp_opts.delete(:class).to_s
      clss << options.delete(:class).to_s
      options[:input_html] = {:class => "ui-datepicker " + clss.join(' ')}.merge inp_opts
      options[:input_html][:value] = object.send(method).strftime("%d.%m.%Y") unless object.send(method).nil?
      label_options = options_for_label(options)
      label_options[:for] ||= options[:id]
      options = options.delete(:input_html) || {}
      options = default_string_options(method, type).merge(html_options) if [:numeric, :string, :password, :text, :phone, :search, :url, :email].include?(type)
      field_id = generate_html_id(method, "")
      options[:id] ||= field_id
      label(method, label_options) << send(:text_field, method, options)
    end
  end

end

Formtastic::SemanticFormBuilder.send(:include, Formtastic::DatePicker)
Formtastic::SemanticFormBuilder.send(:include, Formtastic::DateTimePicker)

module Formtastic

  class SemanticFormBuilder

  protected

    def date_input(method, options)
      datepicker_input method, options
    end

    def datetime_input(method, options)
      datetimepicker_input method, options
    end

  end

end
