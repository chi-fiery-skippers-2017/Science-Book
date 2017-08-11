require 'rails_helper'

describe ObservationsController, type: :controller do

   let!(:user) {User.create!(username:"testuser", email: "test@gmail.com", role: "faculty", password:"password")}

   let!(:proposal) {Proposal.create!(summary: "Flexitarian kogi lomo. Wolf butcher disrupt cornho...", hypothesis: "We need to copy the neural JSON bandwidth!", user: user, title: "Thing")}

   let!(:experiment) {Experiment.create!(results: "Centrifuges are no longer present", conclusion: "Centrifuges = Childhood Whimsy", proposal: proposal, title: "Exy")}

   let!(:observation_e) {Observation.new(body: "Heckin cool!", user: user)}
   # experiment.observations << observation_e


  describe 'GET #index' do
    it 'prints experiment' do
          expect(true).to be true
    end

    it 'responds with status code 200' do
      get :index, params: {id: experiment.id}
      expect(response).to have_http_status 200
    end

    it 'assigns the target experiment to @experiment ' do
      experiment.observations << observation_e

      get :index, params: {id: experiment.id}
      expect(assigns(:experiment)).to eq(observation_e.observable)
    end

    it 'renders the index template' do

      get :index, params: {id: experiment.id}
      expect(response).to render_template(:index)
    end
  end

  describe 'POST #create' do
    context 'when valid params are passed' do
      it 'responds with status code 302' do
        post :create, params: {observation: {body: 'Totes Sweet!', user: user}, id: experiment.id}
        expect(response).to have_http_status 302
      end

      it 'creates a new observation in the database' do
        expect{post :create, params: {observation: {body: 'Totes Sweet!', user: user}, id: experiment.id}}.to change{Observation.all.count}.by 1
      end

      it 'assigns the newly created observation to @observation' do
        post :create, params: {observation: {body: 'Totes Sweet!', user: user}, id: experiment.id}
        expect(assigns(:observation)). to eq Observation.last
      end

      it 'redirects to the experiment associated with observation' do
        post :create, params: {observation: {body: 'Totes Sweet!', user: user}, id: experiment.id}
        expect(response).to redirect_to("/experiments/#{experiment.id}/observations")
      end

    end

    context 'when invalid params are passed' do
      it 'responds with status code 422' do
        post :create, params: {observation: {body: nil , user: user}, id: experiment.id}
        expect(response).to have_http_status 422
      end

      it 'does not create a new observation in the database' do
        expect{post :create, params: {observation: {body: nil, user: user}, id: experiment.id}}.not_to change{Observation.all.count}
      end

      it 'renders the index template' do
        post :create, params: {observation: {body: nil , user: user}, id: experiment.id}
        expect(response).to render_template(:index)
      end
    end
  end

  # describe 'PUT' do
  # end

  # describe 'DELETE' do
  # end

end