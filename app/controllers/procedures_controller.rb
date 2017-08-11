class ProceduresController < ApplicationController
	before_action :authenticate!

	def index
		@experiment = Experiment.find(params[:experiment_id])
		@procedures = @experiment.procedures.all
	end

	# def new
	# end

	def create
		@experiment = Experiment.find(params[:experiment_id])

		@procedure = @experiment.procedures.new(procedure_params)
		@procedure.save
		redirect_to experiment_procedures_path(params[:experiment_id])
	end

	# def show
	# end

	private
		def procedure_params
			params.require(:procedure).permit(:username, :body)
		end

	end
