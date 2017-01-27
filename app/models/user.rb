class User < ApplicationRecord
	has_many :posts
	has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :user_name, :email, :first_name, :password, :last_name, presence: true
  validates :user_name, :email, uniqueness: true
end
