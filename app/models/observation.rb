class Observation < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  belongs_to :observable, polymorphic: true

  validates :body, :user_id, :observable, presence: true
end
