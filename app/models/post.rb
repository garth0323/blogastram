class Post < ApplicationRecord
	paginates_per 5

	belongs_to :user
	has_many :comments

	validates :title, :body, :user_id, presence: true
end
