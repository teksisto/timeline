require "rails_helper"

RSpec.describe OutlinesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/outlines").to route_to("outlines#index")
    end

    it "routes to #new" do
      expect(:get => "/outlines/new").to route_to("outlines#new")
    end

    it "routes to #show" do
      expect(:get => "/outlines/1").to route_to("outlines#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/outlines/1/edit").to route_to("outlines#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/outlines").to route_to("outlines#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/outlines/1").to route_to("outlines#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/outlines/1").to route_to("outlines#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/outlines/1").to route_to("outlines#destroy", :id => "1")
    end

  end
end
