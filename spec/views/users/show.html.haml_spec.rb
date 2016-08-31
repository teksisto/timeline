require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :label => "Label"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Label/)
  end
end
