require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
      :label => "MyString",
      :description => "MyString",
      :age => false,
      :period => false,
      :link => "MyString"
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "input#event_label[name=?]", "event[label]"

      assert_select "input#event_description[name=?]", "event[description]"

      assert_select "input#event_age[name=?]", "event[age]"

      assert_select "input#event_period[name=?]", "event[period]"

      assert_select "input#event_link[name=?]", "event[link]"
    end
  end
end
