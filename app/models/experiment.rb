class Experiment < ApplicationRecord
  belongs_to :proposal
  has_many :procedures
  has_many :comments, as: :commentable
  has_many :observations, as: :observable

  validates :title, presence: true
  before_save :default_values

  def default_values
    self.status ||= 'Open' # note self.status = 'open' if self.status.nil? 
  end
end
