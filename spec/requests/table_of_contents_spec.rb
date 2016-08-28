require 'rails_helper'

RSpec.describe "TableOfContents", type: :request do
  describe "GET /table_of_contents" do
    it "works! (now write some real specs)" do
      get table_of_contents_path
      expect(response).to have_http_status(200)
    end
  end
end
