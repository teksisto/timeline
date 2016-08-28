require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :label => "MyString",
      :description => "MyString",
      :age => false,
      :period => false,
      :link => "MyString"
    ))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do

      assert_select "input#event_label[name=?]", "event[label]"

      assert_select "input#event_description[name=?]", "event[description]"

      assert_select "input#event_age[name=?]", "event[age]"

      assert_select "input#event_period[name=?]", "event[period]"

      assert_select "input#event_link[name=?]", "event[link]"
    end
  end
end
