class AtendimentosController < ApplicationController
	before_action :set_atendimento, only: [:show, :edit, :update, :destroy]

	# GET /atendimentos
	# GET /atendimentos.json
	def search
		if params[:search]
			@atendimentos = Atendimento.search(params[:search]).order("date ASC")
		else
			@atendimentos = Atendimento.all.order('date ASC').limit(100)
		end
	end

	def index
		if current_user.present?
			@atendimentos = Atendimento.all
		else
			redirect_to '/users/sign_in'
		end
	end

	# GET /atendimentos/1
	# GET /atendimentos/1.json
	def show
	end

	# GET /atendimentos/new
	def new
		@atendimento = Atendimento.new
	end

	# GET /atendimentos/1/edit
	def edit
	end

	# POST /atendimentos
	# POST /atendimentos.json
	def create
		@atendimento = Atendimento.new(atendimento_params)

		respond_to do |format|
			if @atendimento.save
				flash[:success] = 'Agendamento cadastrado com sucesso!'
				format.html { redirect_to @atendimento }
				format.json { render :show, status: :created, location: @atendimento }
			else
				format.html { render :new }
				format.json { render json: @atendimento.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /atendimentos/1
	# PATCH/PUT /atendimentos/1.json
	def update
		respond_to do |format|
			if @atendimento.update(atendimento_params)
				flash[:success] = 'Agendamento alterado com sucesso!'
				format.html { redirect_to @atendimento }
				format.json { render :show, status: :ok, location: @atendimento }
			else
				format.html { render :edit }
				format.json { render json: @atendimento.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /atendimentos/1
	# DELETE /atendimentos/1.json
	def destroy
		@atendimento.destroy
		respond_to do |format|
			flash[:success] = 'Agendamento deletado com sucesso!'
			format.html { redirect_to atendimentos_url }
			format.json { head :no_content }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_atendimento
		@atendimento = Atendimento.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def atendimento_params
		params.require(:atendimento).permit(:date, :title, :description)
	end
end
