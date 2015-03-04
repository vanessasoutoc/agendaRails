class UsersController < ApplicationController
	before_filter :authorize_admin, only: :create

	def index
		@users = User.all.order('fullname ASC')
	end

	# GET /atendimentos/1
	# GET /atendimentos/1.json
	def show
	end

	# GET /atendimentos/new
	def new
		@user = User.new
	end

	# GET /atendimentos/1/edit
	def edit

	end


	def create
		@user = User.new(user_params)
		respond_to do |format|
			if @user.save
				flash[:success] = 'Usuário cadastrado com sucesso!'
				format.html { redirect_to users_url }
				format.json { render :show, status: :created, location: @user }
			else
				format.html { render :new }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end
	# PATCH/PUT /users/1
	# PATCH/PUT /users/1.json
	def update
		respond_to do |format|
			if @user.update(user_params)
				flash[:success] = 'Usuário alterado com sucesso!'
				format.html { redirect_to users_url }
				format.json { render :show, status: :ok, location: @user }
			else
				format.html { render :edit }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /users/1
	# DELETE /users/1.json
	def destroy
		@user = User.find(params[:id])
		if @user.present?
			@user.destroy
			respond_to do |format|
				flash[:success] = 'Usuário deletado com sucesso!'
				format.html { redirect_to users_url }
				format.json { head :no_content }
			end
		end

	end

	private

	# This should probably be abstracted to ApplicationController
	# as shown by diego.greyrobot
	def authorize_admin
		return unless !current_user.admin?
		redirect_to root_path, alert: 'Apenas Administradores!'
	end
	def set_user
		@user = User.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def user_params
		params.require(:user).permit(:fullname, :email, :password, :password_confirmation, :remember_me, :admin)
	end
end
