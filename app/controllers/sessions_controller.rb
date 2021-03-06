class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])

    if @user.nil?
      flash[:errors] = "Incorrect username or password"
      render :new
    else
      login!(@user)
      redirect_to users_url
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end
end
