require 'rails_helper'

RSpec.describe 'Groups page', type: :system do
  include Capybara::DSL

  before(:each) do
    @user = User.create!(name: 'Eli', email: 'test@gmail.com', password: '123456')
    @group = Group.create!(name: 'You need to sign in or sign up before continuing.', description: 'You need to sign in or sign up before continuing', user_id: @user.id)
    @user.skip_confirmation!
    @user.save!
    visit new_user_session_path
    fill_in 'user_email', with: 'test20@gmail.com'
    fill_in 'user_password', with: '1234z56'
    click_button 'Next'
    sleep(1)
    # visit groups_path
  end

  after(:each) do
    sleep(2)
  end

  describe 'Groups /index' do
    it 'displays the name of group' do
      visit groups_path
      expect(page).to have_content(@group.name)
    end
  end

  describe 'Category /new' do
    it 'displays a form with name and description' do
      visit new_group_path
      expect(page).to have_content('You need to sign in or sign up before continuing.')
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end
end
