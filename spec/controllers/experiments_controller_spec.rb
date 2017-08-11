require 'rails_helper'

RSpec.describe ExperimentsController, type: :controller do
	let!(:user) {User.create!(username: Faker::Internet.user_name, email:Faker::Internet.email, password_digest: "password", role: "Experimenter")}

	let!(:proposal) { Proposal.create!(title: Faker::Hipster.word, summary: Faker::Hipster.paragraph, hypothesis: Faker::Hacker.say_something_smart, user_id: user.id)}

	let!(:experiment) { Experiment.create!(title: Faker::Hipster.sentence, proposal_id: proposal.id, username: "sahamak" )}

	describe "Get #index" do
		it "responds with status code 200" do
			get :index
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "renders the :index template" do

			get :index
			expect(response).to render_template("index")
		end
	end

	describe "Get #new" do
		it "responds with status code 200" do
			get :new
			expect(response).to have_http_status 200
		end
		it "assigns a new experiment to @experiment" do
			get :new
			expect(assigns(:experiment)).to be_a_new Experiment
		end
		it "renders the :new template" do
			get :new
			expect(response).to render_template(:new)
		end
	end

	# describe "POST #create" do
	# 	context "when valid params are passed" do
	# 		xit "responds with status code 302" do
	# 			post :create,  params:{ experiment: { title: "something diff", proposal_id: proposal.id, username: "sahamak"} }
	# 			experiment_new = assigns(:experiment)
	# 			expect(experiment_new.persisted?).to be true
	# 			# expect(assigns(:experiment)).to eq Experiment.last
	# 			# expect(flash[:notice]).to be_present
	# 		end
	#
	# 		xit "sets a notice that the experiment was successfully created" do
	# 			post :create,  params:{ experiment: { title: "new new new", proposal_id: proposal.id, username: "sahamak"} }
	# 			expect(flash[:notice]).to be_present
	# 		end
	# 	end
	# end
end
