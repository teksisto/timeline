require 'rails_helper'

RSpec.describe "quote_versions/new", type: :view do
  before(:each) do
    assign(:quote_version, QuoteVersion.new(
      :quote_id => "MyString",
      :language => "MyString",
      :text => "MyString"
    ))
  end

  it "renders new quote_version form" do
    render

    assert_select "form[action=?][method=?]", quote_versions_path, "post" do

      assert_select "input#quote_version_quote_id[name=?]", "quote_version[quote_id]"

      assert_select "input#quote_version_language[name=?]", "quote_version[language]"

      assert_select "input#quote_version_text[name=?]", "quote_version[text]"
    end
  end
end
