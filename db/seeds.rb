require 'faker'

ROLES = ["Experimenter", "Faculty"]


user_count = 20
comment_count = 50
proposal_count = 100
experiment_count = 100
procedures_count = 200
observations_count = 100

User.create!(username: "admin", email: "admin@gmail.com", password: "password", role: "admin")

user_count.times do
  User.create!(username: Faker::Internet.user_name, email:Faker::Internet.email, password: "password", role: ROLES.sample)
end

proposal_count.times do

  Proposal.create!(title: Faker::Hipster.word, summary: Faker::Hipster.paragraph, hypothesis: Faker::Hacker.say_something_smart, user_id: rand(1..user_count))

end

experiment_count.times do
  Experiment.create!(title: Faker::Hipster.sentence, results: Faker::Hipster.paragraph, conclusion: Faker::Hipster.paragraph, proposal_id: rand(1..proposal_count))
end

procedures_count.times do
  Procedure.create!(body: Faker::Hipster.paragraph, experiment_id: rand(1..experiment_count))
end

observations_count.times do
  Observation.create!(observable_type: "Experiment", observable_id: rand(1..experiment_count), body: Faker::Hipster.paragraph, user_id: rand(1..user_count))
  Observation.create!(observable_type: "Procedure", observable_id: rand(1..procedures_count), body: Faker::Hipster.paragraph, user_id: rand(1..user_count))
end

comment_count.times do
  Comment.create!(commentable_id: rand(1..observations_count), commentable_type: "Observation", body: Faker::Hipster.paragraph, user_id: rand(1..user_count))
  Comment.create!(commentable_id: rand(1..experiment_count), commentable_type: "Experiment", body: Faker::Hipster.paragraph, user_id: rand(1..user_count))
  Comment.create!(commentable_id: rand(1..proposal_count), commentable_type: "Proposal", body: Faker::Hipster.paragraph, user_id: rand(1..user_count))
end
