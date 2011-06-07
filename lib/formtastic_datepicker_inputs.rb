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
      options[:class] = "ui-date-picker " + options[:class]
      options[:value] = (options[:value] || object.send(method)).try(:strftime, format)
      basic_input_helper(:text_field, :string, method, options)
    end
  end
  
  module DateTimePicker
    protected

    def datetime_picker_input(method, options = {}, value = nil)
      format = options[:format] || DATE_FORMATS[:default] || '%d %b %Y %H:%M'
      options[:class] = "ui-datetime-picker " + options[:class]
      options[:value] = (options[:value] || object.send(method)).try(:strftime, format)
      basic_input_helper(:text_field, :string, method, options)
    end
  end
end

Formtastic::SemanticFormBuilder.send(:include, Formtastic::DatePicker)
Formtastic::SemanticFormBuilder.send(:include, Formtastic::DateTimePicker)
