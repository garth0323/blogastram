require 'rails_helper'

describe :user do
  describe 'creating user' do
    it 'can sign up a user' do
      visit new_user_registration_path

      fill_in 'User name', with: "Garth123"
      fill_in 'First name', with: "Garth"
      fill_in 'Last name', with: "Gaughan"
      fill_in 'Email', with: "email@gmail.com"
      fill_in 'Password', with: "password"
      fill_in 'Password confirmation', with: "password"
      click_on "Sign up"
      
      expect(page).to have_content("My Account")
    end
  end

  describe 'signing in a user' do
    let(:user) { create :user }
    it 'can sign in a user' do
      visit new_user_session_path
  
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on "Sign in"
      
      expect(page).to have_content("My Account")
    end
  end

  describe 'logging out a user' do
    let(:user) { create :user }
    it 'logs out correctly' do
      visit new_user_session_path
  
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on "Sign in"
      
      expect(page).to have_content("My Account")
      expect(page).to_not have_content("Sign in")

      click_on "Log Out"

      expect(page).to_not have_content("My Account")
      expect(page).to have_content("Sign In")
    end
  end
end