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

    def date_picker_input(method, options = {})
      format = options[:format] || DATE_FORMATS[:default] || '%d %b %Y'
      string_input(method, date_picker_options(format, object.send(method)).merge(options))
    end

    # Generate html input options for the datepicker_input
    #
    def date_picker_options(format, value = nil)
      {:input_html => {:class => 'ui-date-picker',:value => value.try(:strftime, format)}}
    end
  end
  
  module DateTimePicker
    protected

    def datetime_picker_input(method, options = {})
      format = options[:format] || DATE_FORMATS[:default] || '%d %b %Y %H:%M'
      string_input(method, datetime_picker_options(format, object.send(method)).merge(options))
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
