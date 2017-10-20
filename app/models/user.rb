class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  has_secure_password
  has_many :groups, dependent: :destroy


  validates :password, presence: true, :on => :create
  validates :first_name, :last_name, :email, presence: true
  validates :first_name, :last_name, length: {minimum: 2}
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

end
