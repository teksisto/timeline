require 'rails_helper'

RSpec.describe "quotes/edit", type: :view do
  before(:each) do
    @quote = assign(:quote, Quote.create!(
      :label => "MyString",
      :source_id => "MyString"
    ))
  end

  it "renders the edit quote form" do
    render

    assert_select "form[action=?][method=?]", quote_path(@quote), "post" do

      assert_select "input#quote_label[name=?]", "quote[label]"

      assert_select "input#quote_source_id[name=?]", "quote[source_id]"
    end
  end
end
