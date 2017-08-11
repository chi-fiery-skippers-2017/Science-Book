class Proposal < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :experiments

  validates_presence_of :title, :summary, :hypothesis, :user_id
end
