class ExperimentsController < ApplicationController
	before_action :authenticate!

	def index
		@experiments = Experiment.all.order('created_at DESC')
	end

	def new
		@proposal = Proposal.find_by(id: params[:proposal_id])
		@experiment = Experiment.new
	end

	def create
		#TODO Create dropdown menu in form of all user scientists, then use params & find_by
		# @user = current_user
		@proposal = Proposal.find_by(id: params[:proposal_id])
		@experiment = Experiment.new(experiment_params)
		# @experiment.user = @user
		if @proposal.experiments << @experiment
			redirect_to @experiment, notice: 'Experiment was successfully created'
		else
			render 'new', status: 422
		end
	end

	def show
		@experiment = Experiment.find(params[:id])
	end

	private
		def experiment_params
			params.require(:experiment).permit(:title, :username, :proposal_id)
		end

end
