class MainController < ApplicationController
  # include ApplicationHelper

  def index
    if logged_in?
      redirect_to proposals_path
    else
      render '/index.html'
    end
  end
end