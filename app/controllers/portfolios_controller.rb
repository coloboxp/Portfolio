class PortfoliosController < ApplicationController
before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
def index
  @portfolio_items = Portfolio.all

  # portfolio_items.angular
  # portfolio_items.ruby_on_rails_portfolio_items
end

def new
  @portfolio = Portfolio.new

  3.times { @portfolio.technologies.build }
end

# POST /portfolio
# POST /portfolio.json
def create
  @portfolio = Portfolio.new(portfolio_params)

  respond_to do |format|
    if @portfolio.save
      # format.html { redirect_to @portfolio, notice: 'Your portfolio item is now live.' }
      format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
      format.json { render :show, status: :created, location: @portfolio }
    else
      format.html { render :new }
      format.json { render json: @portfolio.errors, status: :unprocessable_entity }
    end
  end
end

def edit
#  @portfolio = Portfolio.find(params[:id])
end

# PATCH/PUT /portfolios/1
# PATCH/PUT /portfolios/1.json
def update
#  @portfolio = Portfolio.find(params[:id])
  respond_to do |format|
    if @portfolio.update(portfolio_params)
      format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
      format.json { render :show, status: :ok, location: @portfolio }
    else
      format.html { render :edit }
      format.json { render json: @portfolio.errors, status: :unprocessable_entity }
    end
  end
end

def show
#  @portfolio = Portfolio.find(params[:id])
end

# DELETE /portfolios/1
# DELETE /portfolios/1.json
def destroy
#  @portfolio = Portfolio.find(params[:id])
  @portfolio.destroy
  respond_to do |format|
    format.html { redirect_to portfolios_url, notice: 'The portfolio was successfully deleted.' }
    format.json { head :no_content }
  end
end

private

# Use callbacks to share common setup or constraints between actions.
def set_portfolio
  @portfolio = Portfolio.find(params[:id])
end

# Never trust parameters from the scary internet, only allow the white list through.
def portfolio_params
  params.require(:portfolio).permit(:title,
                                    :subtitle,
                                    :body,
                                    technologies_attributes: [:name])
end
end
