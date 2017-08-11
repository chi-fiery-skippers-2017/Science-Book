class UsersController < ApplicationController
  # include ApplicationHelper

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin!, only: [:index, :new, :create]

  def index
    # authorize_admin!
    @users = User.all
  end

  def new
    # authorize_admin!
    @user = User.new
  end

  def create
    # authorize_admin!
    @user = User.new(user_params)
    # puts @user
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    authorize!(@user)
  end

  def update
    authorize!(@user)
    if @user.update_attributes(user_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    authorize!(@user)
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :role)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end
end