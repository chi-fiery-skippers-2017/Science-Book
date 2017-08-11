require 'rails_helper'

RSpec.describe Proposal, type: :model do
    it { should validate_presence_of(:title)}
    it { should validate_presence_of(:summary)}
    it { should validate_presence_of(:hypothesis)}
    it {should validate_presence_of(:user_id)}
end
