class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to videos_path
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end

  end

  def destroy
    logout
    redirect_to root_url
  end

end
