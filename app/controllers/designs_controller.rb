class DesignsController < ApplicationController
  def index
    # @portfolio = Portfolio.find(params[:portfolio_id])
    @designs = Design.where(portfolio_id: params[:portfolio_id])
    @portfolio = Portfolio.find(params[:portfolio_id])
    @design = Design.new
  end

  def new
    @portfolio = Portfolio.find(params[:portfolio_id])
    @design = Design.new
  end

  def create
    @design = Design.new(design_params)
    @portfolio = Portfolio.find(params[:portfolio_id])
    @design.portfolio = @portfolio
    respond_to do |format|
      if @design.save
        format.html { redirect_to portfolio_designs_path(@portfolio) }
        format.json # Follow the classic Rails flow and look for a create.json view
      else
        format.html { render portfolio_designs_path(@portfolio) }
        format.json # Follow the classic Rails flow and look for a create.json view
      end
    end
  end

  def show
  end

  def edit
    @design = Design.find(params[:id])
  end

  def update
    # @portfolio = Portfolio.find(params[:portfolio_id])
    @design = Design.find(params[:id])
    if @design.update(params.require(:design).permit(:title, :description))
      redirect_to portfolio_designs_path(@design.portfolio_id)
    else
      render :edit
    end
  end

  def destroy
    @design = Design.find(params[:id])
    @design.destroy
    redirect_to portfolio_designs_path(@design.portfolio)
  end

  private

  def design_params
    params.require(:design).permit(:title, :description, :portfolio_id)
  end
end
