require "spec_helper"

describe PartTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/part_types").should route_to("part_types#index")
    end

    it "routes to #new" do
      get("/part_types/new").should route_to("part_types#new")
    end

    it "routes to #show" do
      get("/part_types/1").should route_to("part_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/part_types/1/edit").should route_to("part_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/part_types").should route_to("part_types#create")
    end

    it "routes to #update" do
      put("/part_types/1").should route_to("part_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/part_types/1").should route_to("part_types#destroy", :id => "1")
    end

  end
end
