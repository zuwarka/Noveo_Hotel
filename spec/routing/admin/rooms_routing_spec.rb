require "rails_helper"

RSpec.describe Admin::RoomsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/admin/rooms").to route_to("admin/rooms#index")
    end

    it "routes to #new" do
      expect(get: "/admin/rooms/new").to route_to("admin/rooms#new")
    end

    it "routes to #edit" do
      expect(get: "/admin/rooms/1/edit").to route_to("admin/rooms#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/admin/rooms").to route_to("admin/rooms#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/admin/rooms/1").to route_to("admin/rooms#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/admin/rooms/1").to route_to("admin/rooms#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/admin/rooms/1").to route_to("admin/rooms#destroy", id: "1")
    end
  end
end