# FormtasticDatepickerInputs
#To get this solution working in Rails 3, replace:
#
#format = options[:format] || ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS[:default] || ‘%d %b %Y’
#
#with:
#
#format = options[:format] || Date::DATE_FORMATS[:default] || ‘%d %b %Y’
module Formtastic
  if defined?(ActiveSupport::CoreExtensions)
	DATE_FORMATS = ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS
  else
	DATE_FORMATS = Date::DATE_FORMATS
  end
 
  module DatePicker
    protected

    def date_picker_input(method, options = {}, value = nil)
      format = options[:format] || DATE_FORMATS[:default] || '%d %b %Y'
	orig_input_opts = options.delete(:input_html)
	orig_wrapper_opts = options.delete(:wrapper_html)
	
	new_opts = date_picker_options(format, value || object.send(method))
	new_opts[:input_html][:class] += " #{options.delete(:class)}" if options[:class]
	if orig_input_opts
	  new_opts[:input_html][:class] += " #{orig_input_opts.delete(:class)}" if orig_input_opts[:class]
	  new_opts[:input_html].merge(orig_input_opts)
	end
	if orig_wrapper_opts
	  new_opts[:wrapper_html][:class] += " #{orig_wrapper_opts.delete(:class)}" if orig_wrapper_opts[:class]
	  new_opts[:wrapper_html].merge(orig_wrapper_opts)
	end
	
      string_input(method, new_opts)
    end

    # Generate html input options for the datepicker_input
    #
    def date_picker_options(format, value = nil)
      {:input_html => {:class => 'ui-date-picker',:value => value.try(:strftime, format)}}
    end
  end
  
  module DateTimePicker
    protected

    def datetime_picker_input(method, options = {}, value = nil)
      format = options[:format] || DATE_FORMATS[:default] || '%d %b %Y %H:%M'
	orig_input_opts = options.delete(:input_html)
	orig_wrapper_opts = options.delete(:wrapper_html)

	new_opts = datetime_picker_options(format, value || object.send(method)).merge(options
	new_opts[:input_html][:class] += " #{options.delete(:class)}" if options[:class]
	if orig_input_opts
	  new_opts[:input_html][:class] += " #{orig_input_opts.delete(:class)}" if orig_input_opts[:class]
	  new_opts[:input_html].merge(orig_input_opts)
	end
	if orig_wrapper_opts
	  new_opts[:wrapper_html][:class] += " #{orig_wrapper_opts.delete(:class)}" if orig_wrapper_opts[:class]
	  new_opts[:wrapper_html].merge(orig_wrapper_opts)
	end
	
      string_input(method, new_opts)
    end

    # Generate html input options for the datepicker_input
    #
    def datetime_picker_options(format, value = nil)
	  {:wrapper_html => {:class => 'datetime'},:input_html => {:class => 'ui-datetime-picker',:value => value.try(:strftime, format)}}
    end
  end
end

Formtastic::SemanticFormBuilder.send(:include, Formtastic::DatePicker)
Formtastic::SemanticFormBuilder.send(:include, Formtastic::DateTimePicker)
