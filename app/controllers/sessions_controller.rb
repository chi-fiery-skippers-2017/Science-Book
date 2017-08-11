class SessionsController < ApplicationController
  # include ApplicationHelper

  def new
    @user = User.new
  end

  def create
    if logged_in?
      redirect_to root_path
    else
      @user = User.find_by(username: params[:session][:username])
      if @user && @user.authenticate(params[:session][:password])
        # puts "user exists and is authenticated"
        session[:user_id] = @user.id
        redirect_to root_path
      else
        # puts "failed, but user nil returns #{@user.nil?}"
        @errors = ["Incorrect Username or Password"]
        render 'new'
      end
    end
  end

  def destroy
    if logged_in?
      session.delete(:user_id)
      redirect_to new_session_path
    else
      redirect_to '/'
    end
  end

end