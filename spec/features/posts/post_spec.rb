require 'rails_helper'

describe 'posts' do
  describe 'not logged in' do
    it 'cannot create a post if not logged in' do
      visit unauthenticated_root_path
      expect(page).to have_content("Sign In")
      expect(page).not_to have_content("New Post")

      visit new_post_path
      expect(page).to have_content("You need to sign in or sign up before continuing.")
      expect(page).to have_content("Sign in")
    end
  end

  describe 'logged in' do
    let(:user) { create :user }
    before { sign_in(user) }
    
    it 'creates a post successfully' do
      visit new_post_path

      expect(page).to have_content("Add a Post")
      fill_in 'Title', with: "The Great Gatsby"
      fill_in 'Body', with: "A better book than a movie."
      click_on 'Publish'
      expect(page).to have_content("The Great Gatsby")
      expect(page).to have_content(user.user_name)
      expect(page).to have_content("A better book than a movie.")
    end
  end
end