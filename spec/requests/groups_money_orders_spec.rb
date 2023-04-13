require 'rails_helper'

RSpec.describe "GroupsMoneyOrders", type: :request do
  describe "GET /groups/:group_id/money_orders" do
    let(:group) { Group.create(name: "Test Group") }

    it "returns a successful response" do
      get group_money_orders_path(group)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /groups/:group_id/money_orders" do
    let(:group) { Group.create(name: "Test Group") }
    let(:params) { { money_order: { amount: 100, description: "Test Money Order" } } }

    it "creates a new money order" do
      expect {
        post group_money_orders_path(group), params: params
      }.to change(MoneyOrder, :count).by(1)
    end
  end
end
