require 'rails_helper'

RSpec.describe "quote_versions/edit", type: :view do
  before(:each) do
    @quote_version = assign(:quote_version, QuoteVersion.create!(
      :quote_id => "MyString",
      :language => "MyString",
      :text => "MyString"
    ))
  end

  it "renders the edit quote_version form" do
    render

    assert_select "form[action=?][method=?]", quote_version_path(@quote_version), "post" do

      assert_select "input#quote_version_quote_id[name=?]", "quote_version[quote_id]"

      assert_select "input#quote_version_language[name=?]", "quote_version[language]"

      assert_select "input#quote_version_text[name=?]", "quote_version[text]"
    end
  end
end
