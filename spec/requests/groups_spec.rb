require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #new" do
    it "returns a successful response" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new group" do
        expect {
          post :create, params: { group: { name: "Test Group" } }
        }.to change(Group, :count).by(1)
      end

      it "redirects to the created group" do
        post :create, params: { group: { name: "Test Group" } }
        expect(response).to redirect_to(Group.last)
      end
    end

    context "with invalid params" do
      it "returns a successful response" do
        post :create, params: { group: { name: "" } }
        expect(response).to have_http_status(200)
      end

      it "does not create a new group" do
        expect {
          post :create, params: { group: { name: "" } }
        }.not_to change(Group, :count)
      end
    end
  end