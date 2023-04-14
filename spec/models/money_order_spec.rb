require 'rails_helper'
RSpec.describe MoneyOrder, type: :model do
  before(:each) do
    @user = User.create!(name: 'Eliah', email: 'test@gmail.com', password: '123456')
    @group = Group.create(name: 'Baking Powder', description: 'Educative misabuse edit', user_id: @user.id)
    @order = MoneyOrder.create!(name: 'Eliah', author_id: @user.id, amount: 100, group_id: @group.id)
  end
  
  describe 'validations' do
    it 'should match a name' do
      expect(@order.name).to eq('Eliah')
      expect(@order.valid?).to eq(true)
    end

    it 'should validate name' do
      order = MoneyOrder.create(name: '')
      expect(order).to_not be_valid
    end
  end
  describe 'associations' do
    it'should belong to group' do
      expect(@order.group_id).to eq(@group.id)
    end

    it'should belong to user' do
      expect(@order.author_id).to eq(@user.id)
    end
  end
end
