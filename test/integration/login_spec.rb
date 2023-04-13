require 'rails_helper'

RSpec.describe 'Log in page', type: :system do
  describe 'users/signin' do
    before(:each) do
      @user = User.create!(name: 'Simon', email: 'test@gmail.com', password: '123456')
      @user.skip_confirmation!
      @user.save!
      visit new_user_session_path
    end

    after(:each) do
      sleep(2)
    end

    it 'displays email and password input field and submit button' do
      expect(page).to have_field('Email')
      expect(page).to have_field('Password')
      expect(page).to have_button('Log in')
    end

    it 'click on SIGNUP button' do
      # Find the link using a CSS selector that targets both the link text and the icon
      link = find('a', text: 'Sign up', match: :first)
      # Click on the link
      link.click
      sleep(1)
      expect(page).to have_current_path new_user_registration_path
    end

    it 'click on `Forgot your password?`' do
      click_link 'Forgot your password?'
      expect(page).to have_current_path new_user_password_path
    end
  end
end