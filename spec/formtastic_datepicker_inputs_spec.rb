require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "FormtasticDatepickerInputs" do
  include FormtasticDatepickerInputsSpecHelper

  before do
    @output_buffer = ''
    mock_everything
  end

  describe "date_picker_input" do
    before do
      @new_post.stub!(:publish_at).and_return(DateTime.parse('2000-01-02'))
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
    
    it "should format date correctly" do
      output_buffer.concat(@form)
      output_buffer.should have_tag("form li input#post_publish_at[@value='02 Jan 2000']")
    end
  end

  it "should use custom date format correctly" do
    @new_post.stub!(:publish_at).and_return(DateTime.parse('2000-01-02'))
    output_buffer.replace ''
    @form = semantic_form_for(@new_post) do |builder|
      concat(builder.input(:publish_at, :as => :date_picker, :format => '%A, %B %d %Y'))
    end
    output_buffer.concat(@form)
    output_buffer.should have_tag("form li input#post_publish_at[@value='Sunday, January 02 2000']")
  end

  describe "date_time_picker_input" do
    before do
      @new_post.stub!(:publish_at).and_return(DateTime.parse('2000-01-02 03:04'))
      output_buffer.replace ''
      @form = semantic_form_for(@new_post) do |builder|
        concat(builder.input(:publish_at, :as => :date_time_picker))
      end
    end

    it_should_have_input_wrapper_with_class(:date_time_picker)
    it_should_have_input_wrapper_with_id("post_publish_at_input")
    it_should_have_label_with_text(/Publish at/)
    it_should_have_label_for("post_publish_at")
    it_should_have_input_with_id("post_publish_at")
    it_should_have_input_with_type(:text)
    it_should_have_input_with_name("post[publish_at]")
    it_should_have_input_with_class("ui-datetime-picker")
    
    it "should format date correctly" do
      output_buffer.concat(@form)
      output_buffer.should have_tag("form li input#post_publish_at[@value='02 Jan 2000 03:04']")
    end
  end
  
  it "should use custom date/time format correctly" do
    @new_post.stub!(:publish_at).and_return(DateTime.parse('2000-01-02 03:04'))
    output_buffer.replace ''
    @form = semantic_form_for(@new_post) do |builder|
      concat(builder.input(:publish_at, :as => :date_picker, :format => '%A, %B %d %Y %H:%M'))
    end
    output_buffer.concat(@form)
    output_buffer.should have_tag("form li input#post_publish_at[@value='Sunday, January 02 2000 03:04']")
  end
end
