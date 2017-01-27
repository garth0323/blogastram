require 'rails_helper'

describe 'comments' do
  describe 'post exists and user logged in' do
    let(:user) { create :user }
    let(:user2) { create :user }
    before { sign_in(user) }
    let(:post) { create :post, user: user2 }
    
    it 'cannot create a commment' do
      visit post_path(post)
      expect(page).to have_content(post.title)
      expect(page).to have_content("Add a Comment")
      expect(page).not_to have_content(user.user_name)
      fill_in 'Body', with: "this is my comment"
      click_on "Publish"
      expect(page).to have_content(post.title)
      expect(page).to have_content("this is my comment")
      expect(page).to have_content(user.user_name)
    end
  end
end