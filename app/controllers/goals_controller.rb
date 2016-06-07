class GoalsController < ApplicationController
  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    if @goal.save
      redirect_to user_url(current_user)
    else
      flash[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


  def goal_params
    params.require(:goal).permit(:title, :status, :completion)
  end
end
