class DesignsController < ApplicationController
  def index
    # @portfolio = Portfolio.find(params[:portfolio_id])
    @designs = Design.where(portfolio_id: params[:portfolio_id])
    @portfolio = Portfolio.find(params[:portfolio_id])
    @design = Design.new

    if params[:query].present?
      @designs = @designs.where('title ILIKE ?', "%#{params[:query]}%")
    end
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'designs/list', locals: { designs: @designs }, formats: [:html] }
    end
  end

  # likes
  def upvote
    @design = Design.find(params[:id])
    if current_user.voted_up_on? @design
      @design.unliked_by current_user
      Portfolio.find(@design.portfolio_id).subtracting_like!
    else
      @design.liked_by current_user
      Portfolio.find(@design.portfolio_id).new_like!
    end
    render "portfolios/vote.js.erb"
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
    @design = Design.find(params[:id])
    # if @design.update(params.require(:design).permit(:title, :description))
      # redirect_to portfolio_designs_path(@design.portfolio_id)
    # else
      # render :edit
    # end
    @design.update(params.require(:design).permit(:title, :description, :photo))
    respond_to do |format|
      format.html { redirect_to portfolio_designs_path(@design.portfolio_id) }
      format.text { render partial: 'designs/design', locals: { design: @design }, formats: [:html] }
    end
  end

  def destroy
    @design = Design.find(params[:id])
    @design.destroy
    # redirect_to portfolio_designs_path(@design.portfolio)
    respond_to do |format|
      format.html { redirect_to portfolio_designs_path(@design.portfolio_id) }
      format.text { render partial: 'designs/list', locals: { design: @design }, formats: [:html] }
    end
  end

  private

  def design_params
    params.require(:design).permit(:title, :description, :portfolio_id, :photo)
  end
end
