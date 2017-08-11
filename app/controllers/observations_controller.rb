class ObservationsController < ApplicationController
  before_action :authenticate

  def index
    @experiment = Experiment.find(params[:id])
  end

  def create
    @experiment = Experiment.find(params[:id])
    @observation = Observation.new(observation_params)
    @observation.user = User.find_by(session[:id])
    @experiment.observations << @observation

    if @observation.save
      redirect_to action: 'index'
    else
      render :index, status: 422
    end

  end

  private
    def observation_params
      params.require(:observation).permit(:body)
    end
end