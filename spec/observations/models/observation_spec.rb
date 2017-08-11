# require 'rails_helper'

# describe Observation, type: :model do
#   let!(:user) {User.create!(username:"testuser", email: "test@gmail.com", role: "faculty", password:"password")}

#   let!(:proposal) {Proposal.create!(summary: "Flexitarian kogi lomo. Wolf butcher disrupt cornho...", hypothesis: "We need to copy the neural JSON bandwidth!", user: user, title: "Thing")}

#   let!(:experiment) {Experiment.create!(results: "Centrifuges are no longer present", conclusion: "Centrifuges = Childhood Whimsy", proposal: proposal, title: "Exy")}


#   describe "validations" do
#     it "is valid when it has a body, observable, and user_id" do
#       observation_e = Observation.new(body: "Heckin cool!", user: user)
#       experiment.observations << observation_e
#       observation_e.valid?
#       expect(observation_e.errors).to be_empty

#     # end

#     it "is not valid when it is missing a body" do
#       observation_e = Observation.new(body: nil, user: user)
#       experiment.observations << observation_e
#       observation_e.valid?
#       expect(observation_e.errors).not_to be_empty

#     end

#     it "is not valid when it is missing a user_id" do
#       observation_e = Observation.new(body: "Heckin cool!")
#       experiment.observations << observation_e
#       observation_e.valid?
#       expect(observation_e.errors).not_to be_empty
#     end

#     it "is not valid when it is missing an observable" do
#       observation_e = Observation.new(body: "Heckin cool!")
#       observation_e.valid?
#       expect(observation_e.errors).not_to be_empty
#     end
#   end

# end