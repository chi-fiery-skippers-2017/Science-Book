class Proposal < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :experiments
end
