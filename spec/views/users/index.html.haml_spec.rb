require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :label => "Label"
      ),
      User.create!(
        :label => "Label"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Label".to_s, :count => 2
  end
end
