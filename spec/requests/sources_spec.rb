require 'rails_helper'

RSpec.describe "Sources", type: :request do
  describe "GET /sources" do
    it "works! (now write some real specs)" do
      get sources_path
      expect(response).to have_http_status(200)
    end
  end
end
