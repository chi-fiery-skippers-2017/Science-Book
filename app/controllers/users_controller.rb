class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to 'main#index'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to 'main#index'
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to 'main#index'
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :role)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end
end