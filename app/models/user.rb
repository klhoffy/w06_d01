class User < ActiveRecord::Base
	has_secure_password
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
	validates :name, presence: true
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
	validates :password, presence: true, confirmation: true
end
