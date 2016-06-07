class UsersController < ApplicationController
  before_filter :require_logged_in!, except: [:new, :create]

  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.includes(:goals).find(params[:id])

    if current_user.id == params[:id].to_i
      @goals = @user.goals
    else
      @goals = @user.goals.select { |goal| goal.status == "Public" }
    end

  end

  def new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      redirect_to users_url
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:username, :password)

  end
end
