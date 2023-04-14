require 'rails_helper'

RSpec.describe Group, type: :model do
  before :each do
    @user = User.create!(name: 'Eliah', email: 'test@gmail.com', password: '123456')
    @group = Group.create(name: 'Baking Powder', description: 'Educative misabuse edit', user_id: @user.id)
  end

  describe 'validations' do
    it "should have a valid name" do
      group = Group.new(name: '')
      expect(group).to_not be_valid
      expect(group.errors[:name]).to include("can't be blank")
    end

    it "should have a valid description" do
      group = Group.new(description: '')
      expect(group).to_not be_valid
      group = Group.new(description: nil)
      expect(group).to_not be_valid
      group = Group.new(description: '')
      expect(group).to_not be_valid
    end

    it "should have a valid user" do
      group = Group.new(user_id: '')
      expect(group).to_not be_valid
      group = Group.new(user_id: nil)
      expect(group).to_not be_valid
    end
  end

  describe 'associations' do
    it 'should belong to a user' do
      expect(@group).to belong_to(:user)
    end

    it 'should have many money orders' do
      expect(@group).to have_many(:money_orders)
    end

    it'should have many users' do
      expect(@group).to have_many(:users)
  end
end
     
