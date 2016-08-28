require "rails_helper"

RSpec.describe QuoteVersionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/quote_versions").to route_to("quote_versions#index")
    end

    it "routes to #new" do
      expect(:get => "/quote_versions/new").to route_to("quote_versions#new")
    end

    it "routes to #show" do
      expect(:get => "/quote_versions/1").to route_to("quote_versions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/quote_versions/1/edit").to route_to("quote_versions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/quote_versions").to route_to("quote_versions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/quote_versions/1").to route_to("quote_versions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/quote_versions/1").to route_to("quote_versions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/quote_versions/1").to route_to("quote_versions#destroy", :id => "1")
    end

  end
end
