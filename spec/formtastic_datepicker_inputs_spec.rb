require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "FormtasticDatepickerInputs" do
  include FormtasticDatepickerInputsSpecHelper

  before do
    @output_buffer = ''
    mock_everything
  end

  describe "date_picker_input" do
	before do
      output_buffer.replace ''
      @form = semantic_form_for(@new_post) do |builder|
        concat(builder.input(:publish_at, :as => :date_picker))
      end
    end

    it_should_have_input_wrapper_with_class(:date_picker)
    it_should_have_input_wrapper_with_id("post_publish_at_input")
    it_should_have_label_with_text(/Publish at/)
    it_should_have_label_for("post_publish_at")
    it_should_have_input_with_id("post_publish_at")
    it_should_have_input_with_type(:text)
    it_should_have_input_with_name("post[publish_at]")
    it_should_have_input_with_class("ui-date-picker")
  end
  describe "datetime_picker_input" do
	before do
      output_buffer.replace ''
      @form = semantic_form_for(@new_post) do |builder|
        concat(builder.input(:publish_at, :as => :datetime_picker))
      end
    end

    it_should_have_input_wrapper_with_class(:datetime_picker)
    it_should_have_input_wrapper_with_id("post_publish_at_input")
    it_should_have_label_with_text(/Publish at/)
    it_should_have_label_for("post_publish_at")
    it_should_have_input_with_id("post_publish_at")
    it_should_have_input_with_type(:text)
    it_should_have_input_with_name("post[publish_at]")
    it_should_have_input_with_class("ui-datetime-picker")
  end
end
