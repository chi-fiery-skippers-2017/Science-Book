class ObservationsController < ApplicationController
  before_action :authenticate!

  def index
    if params[:experiment_id]
      @experiment = Experiment.find(params[:experiment_id])

    elsif params[:procedure_id]
      @procedure = Procedure.find(params[:procedure_id])

    end


  end

  def create
    # p params
    if params[:experiment_id]
      @experiment = Experiment.find(params[:experiment_id])
      @observation = Observation.new(observation_params)
      @observation.user = current_user
      @observation.observable = @experiment



      if @observation.save
        redirect_to @experiment
      else
        render :index, status: 422
      end
    elsif params[:procedure_id]
      @procedure = Procedure.find(params[:procedure_id])
      @observation = Observation.new(observation_params)
      @observation.user = current_user
      @observation.observable = @procedure

      if @observation.save
        redirect_to experiment_procedures_path(@procedure.experiment.id)
      else
        render :index, status: 422
      end
    end


  end

  private
    def observation_params
      params.require(:observation).permit(:body)
    end
end
