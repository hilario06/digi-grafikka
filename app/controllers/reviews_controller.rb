class ReviewsController < ApplicationController
  def create
    @portfolio = Portfolio.find(params[:portfolio_id])
    @review = Review.new(review_params)
    @review.portfolio = @portfolio
    @review.user = current_user
    if @review.save
      redirect_to portfolio_path(@portfolio)
    else
      render 'portfolios/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to portfolio_path(params[:portfolio_id])
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :rating)
  end
end
