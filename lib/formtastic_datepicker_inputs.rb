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
      options[:format] ||= DATE_FORMATS[:default] || '%d %b %Y'
      string_input(method, options.merge(date_picker_options(options, object.send(method))))
    end

    # Generate html input options for the datepicker_input
    #
    def date_picker_options(options, value = nil)
      options[:input_html] ||= {}
      options[:input_html] = options[:input_html].reverse_merge!({
        :class => (options[:input_html][:class]) ? "ui-date-picker #{options[:input_html][:class]}" : 'ui-date-picker',
        :value => value.try(:strftime, options[:format])
      })
      options
    end
  end
  
  module DateTimePicker
    protected

    def datetime_picker_input(method, options = {})
      format = options[:format] || DATE_FORMATS[:default] || '%d %b %Y %H:%M'
      string_input(method, options.merge(datetime_picker_options(options, object.send(method))))
    end

    # Generate html input options for the datepicker_input
    #
    def datetime_picker_options(options, value = nil)
      options[:wrapper_html] ||= {}
      options[:wrapper_html] = options[:wrapper_html].reverse_merge!({
        :class => (options[:wrapper_html][:class]) ? "datetime #{options[:input_html][:class]}" : 'datetime'
      })
      options[:input_html] ||= {}
      options[:input_html] = options[:input_html].reverse_merge!({
        :class =>  (options[:input_html][:class]) ? "ui-date-picker #{options[:input_html][:class]}" : 'ui-date-picker',
        :value => value.try(:strftime, options[:format])
      })
      options
    end
  end
end

Formtastic::SemanticFormBuilder.send(:include, Formtastic::DatePicker)
Formtastic::SemanticFormBuilder.send(:include, Formtastic::DateTimePicker)
