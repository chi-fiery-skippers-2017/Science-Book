# require 'rails_helper'

# describe Comment, type: :model do
#   let!(:user) {User.create!(username: "user1", email: "u@u.com")}

#   let!(:proposal) {Proposal.create!(summary: "Flexitarian kogi lomo. Wolf butcher disrupt cornho...", hypothesis: "We need to copy the neural JSON bandwidth!", user: user)}

#   let!(:experiment) {Experiment.create!(results: "Centrifuges are no longer present", conclusion: "Centrifuges = Childhood Whimsy", proposal: proposal)}


#   describe "validations" do
#     it "is valid when it has a body, commentable, and user_id" do
#       comment_e = Comment.new(body: "Heckin cool!", user: user)
#       experiment.comments << comment_e
#       comment_e.valid?
#       expect(comment_e.errors).to be_empty

#     end

#     it "is not valid when it is missing a body" do
#       comment_e = Comment.new(body: nil, user: user)
#       experiment.comments << comment_e
#       comment_e.valid?
#       expect(comment_e.errors).not_to be_empty

#     end

#     it "is not valid when it is missing a user_id" do
#       comment_e = Comment.new(body: "Heckin cool!")
#       experiment.comments << comment_e
#       comment_e.valid?
#       expect(comment_e.errors).not_to be_empty
#     end

#     it "is not valid when it is missing an commentable" do
#       comment_e = Comment.new(body: "Heckin cool!")
#       comment_e.valid?
#       expect(comment_e.errors).not_to be_empty
#     end
#   end

# end