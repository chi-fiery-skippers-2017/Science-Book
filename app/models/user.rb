class User < ApplicationRecord
  has_many :proposals
  has_many :comments
  has_many :observations

  has_secure_password

  validates_presence_of :username, :email, :role
end
