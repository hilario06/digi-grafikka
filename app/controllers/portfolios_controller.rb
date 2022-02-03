class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: %i[show edit update destroy]

  def index
    @portfolios = Portfolio.all

    # if params[:query].present?
    #   @portfolios = policy_scope(Portfolio).where("title ILIKE ?  OR author ILIKE ?", "%#{params[:query]}%","%#{params[:query]}%")
    # # qu epusieron para las busquedas?
    # else
    #   @portfolios = policy_scope(Portfolio).order(created_at: :desc)
    # end
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
  end

  def new
    @portfolio = Portfolios.new
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
