require "spec_helper"

describe BirdsoundsController do
  describe "routing" do

    it "routes to #index" do
      get("/birdsounds").should route_to("birdsounds#index")
    end

    it "routes to #new" do
      get("/birdsounds/new").should route_to("birdsounds#new")
    end

    it "routes to #show" do
      get("/birdsounds/1").should route_to("birdsounds#show", :id => "1")
    end

    it "routes to #edit" do
      get("/birdsounds/1/edit").should route_to("birdsounds#edit", :id => "1")
    end

    it "routes to #create" do
      post("/birdsounds").should route_to("birdsounds#create")
    end

    it "routes to #update" do
      put("/birdsounds/1").should route_to("birdsounds#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/birdsounds/1").should route_to("birdsounds#destroy", :id => "1")
    end

  end
end
