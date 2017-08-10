require "rails_helper"

RSpec.describe ProposalsController, type: :controller do
  let!(:user) {User.create!(username: "Test", password_digest: "Test", email: "test@test.com")}
  let!(:proposal) { Proposal.create!(title: "Test", summary: "Test", hypothesis: "Test", user_id: user.id)}
  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq (200)
    end

    it "has a collection of proposal objects" do
      get :index
      expect(assigns(:proposals)).to all( be_a Proposal)
    end
  end

  describe "GET show" do
    it "has a 200 status code" do
      get :show, params: {id: proposal.id}
      expect(response.status).to eq (200)
    end

    it "has a proposal object" do
      get :show, params: {id: proposal.id}
      expect(assigns(:proposal)).to be_a Proposal
    end
  end

  describe "GET new" do
    it "has a 200 status code" do
      get :new
      expect(response.status).to eq (200)
    end

    it "has an empty proposal object" do
      get :new
      expect(assigns(:proposal)).to have_attributes(title: nil, summary: nil, hypothesis: nil, user_id: nil)
    end
  end

  describe "POST create" do
    it "renders 'new' on invalid input" do
       post :create, params: { proposal: { title: nil } }
       expect(response.status).to eq 422
       expect(response).to render_template(:new)
    end

    it "saves proposal to db" do
      post :create, params: { proposal: {title: "Test", summary: "test", hypothesis: "test" } }
      expect(assigns(:proposal).persisted?).to be true
    end

    it "redirects to that proposal on successful creation" do
      post :create, params: { proposal: { title: "Test", summary: "test", hypothesis: "test" } }
      expect(response).to have_http_status 302
      expect(response).to redirect_to("/proposals/#{Proposal.last.id}")
    end
  end

  describe "EDIT new" do
    xit "" do
      get :edit
    end
  end
end
