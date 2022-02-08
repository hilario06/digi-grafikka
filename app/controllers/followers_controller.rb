class FollowersController < ApplicationController
  def index
    # @followers = Follower.where(portfolio_id: params[:portfolio_id])
    # @portfolio = Portfolio.find(params[:portfolio_id])
    @followers = Follower.where(user: current_user)
  end

  def new
    @portfolio = Portfolio.find(params[:portfolio_id])
    @follower = Follower.new
  end

  def create
    @follower = Follower.new
    @follower.portfolio_id = params[:portfolio_id]
    @follower.user = current_user
    if @follower.save
      redirect_to portfolio_followers_path(params[:portfolio_id])
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def follower_params
    params.require(:follower).permit(:portfolio_id)
  end
end
