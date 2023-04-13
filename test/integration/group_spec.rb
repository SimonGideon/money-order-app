require 'rails_helper'

RSpec.describe 'Groups page', type: :system do
  describe 'Groups /index' do
    before(:each) do
      @user = User.create!(name: 'Eliah', email: 'test@gmail.com', password: '123456')
      @group = Group.create!(name: 'Baking Powder', description: 'Educative misabuse edit', user_id: @user.id)
      @user.skip_confirmation!
      @user.save!
      visit new_user_session_path
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
      sleep(1)
      visit groups_path
    end

    after(:each) do
      sleep(2)
    end

    it 'displays the name, measurement unit, price of food' do
      expect(page).to have_content(@group.name)
    end
  end

  describe 'Foods /new' do
    before(:each) do
      @user = User.create!(name: 'name', email: 'test@gmail.com', password: '123456')
      @group = Group.create!(name: 'Baking Powder', description: 'Educative misabuse edit', user_id: @user.id)
      @user.skip_confirmation!
      @user.save!
      visit new_user_session_path
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
      sleep(1)
      visit new_food_path
    end

    after(:each) do
      sleep(2)
    end

    it 'displays a form with name, measurement unit, quantity, price' do
      expect(page).to have_content('Name')
      expect(page).to have_content('Description')
      expect(page).to have_content('Browse')
    end
  end
end
