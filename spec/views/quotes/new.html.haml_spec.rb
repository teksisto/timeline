require 'rails_helper'

RSpec.describe "quotes/new", type: :view do
  before(:each) do
    assign(:quote, Quote.new(
      :label => "MyString",
      :source_id => "MyString"
    ))
  end

  it "renders new quote form" do
    render

    assert_select "form[action=?][method=?]", quotes_path, "post" do

      assert_select "input#quote_label[name=?]", "quote[label]"

      assert_select "input#quote_source_id[name=?]", "quote[source_id]"
    end
  end
end
