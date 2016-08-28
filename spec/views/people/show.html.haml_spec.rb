require 'rails_helper'

RSpec.describe "people/show", type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(
      :label => "Label",
      :description => "Description",
      :screen_label => "Screen Label",
      :link => "Link"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Label/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Screen Label/)
    expect(rendered).to match(/Link/)
  end
end
