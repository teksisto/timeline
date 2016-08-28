require "rails_helper"

RSpec.describe TableOfContentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/table_of_contents").to route_to("table_of_contents#index")
    end

    it "routes to #new" do
      expect(:get => "/table_of_contents/new").to route_to("table_of_contents#new")
    end

    it "routes to #show" do
      expect(:get => "/table_of_contents/1").to route_to("table_of_contents#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/table_of_contents/1/edit").to route_to("table_of_contents#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/table_of_contents").to route_to("table_of_contents#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/table_of_contents/1").to route_to("table_of_contents#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/table_of_contents/1").to route_to("table_of_contents#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/table_of_contents/1").to route_to("table_of_contents#destroy", :id => "1")
    end

  end
end
