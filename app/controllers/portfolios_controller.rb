class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: %i[show edit update destroy]

  def follow
    @portfolio = Portfolio.all.find(params[:id])
    if @portfolio.following?(current_user)
      @follower = Follower.where(user_id: current_user.id)
                          .and(Follower.where(portfolio_id: @portfolio.id))
      @follower[0].destroy
    else
      Follower.create(user_id: current_user.id, portfolio_id: @portfolio.id)
    end
    redirect_to portfolio_path(@portfolio, anchor: "button-follower")
  end

  def is_portfolio
    @portfolio = Portfolio.find_by(user_id: current_user.id)
    if @portfolio
      redirect_to portfolio_designs_path(@portfolio)
    else
      # redirect_to welcome_portfolios_path
      redirect_to welcome_path
    end
  end

  def welcome1

  end

  def index
    # if params[:query].present?
    #   @portfolios = policy_scope(Portfolio).where("title ILIKE ?  OR author ILIKE ?", "%#{params[:query]}%","%#{params[:query]}%")
    # # qu epusieron para las busquedas?
    # else
    #   @portfolios = policy_scope(Portfolio).order(created_at: :desc)
    # end
    @portfolios = Portfolio.includes(:user)
  end

  def show
    # aqui deberia verse asip peor ya lo puse en set_portfolio
    # @portfolio = Portfolio.find(params[:id])
    # GEOCODING
    # @latitude_and_longitude = User.geocoded
    # @latitude_and_longitude = User.near(current_user.address, 10)
    # @markers = @latitude_and_longitude.geocoded.map do |user|
    #  {
    #    lat: user.latitude,
    #    lng: user.longitude,
    #    info_window: render_to_string(partial: "info_window", locals: { user: user })
    # }
    # end
    # authorize @portfolio
    # @portfolio = Portfolio.find(params[:id])
    @review = Review.new
  end

  def new
    @portfolio = Portfolio.new
    # authorize @portfolio
  end

  def create
    @portfolio = Portfolio.new(params[:portfolio])
    @portfolio.save
    # @portfolio = current_user.portfolios.new(portfolio_params)
    # authorize @portfolio
    # if @portfolio.save
    #   redirect_to portfolio_path(@portfolio)
    # else
    #   render :new
    # end
  end

  def edit
    # authorize @portfolio
  end

  def update
    # @portfolio = Portfolio.find(params[:id])
    @portfolio.update(params[:portfolio])
    # authorize @portfolio
    # if @portfolio.update(portfolio_params)
    #   redirect_to portfolio_path(@portfolio)
    # else
    #   render :edit
    # end
  end

  def destroy
    @restaurant.destroy

    # @portfolio = Portfolio.find(params[:id])
    # authorize @portfolio
    # @portfolio.destroy if @portfolio.present?
    # redirect_to portfolios_path
  end

  private

  def set_portfolio
    @portfolio = Portfolio.find(params[:id])
  end

  def portfolio_params
    params.require(:portfolio).permit(
      :about
    )
  end
end
