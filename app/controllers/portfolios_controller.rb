class PortfoliosController < ApplicationController

def index
  @portfolioItems = Portfolio.all
end

def new
  @portfolio = Portfolio.new
end

# POST /portfolio
# POST /portfolio.json
def create
  @portfolio = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

  respond_to do |format|
    if @portfolio.save
      #format.html { redirect_to @portfolio, notice: 'Your portfolio item is now live.' }
      format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
      format.json { render :show, status: :created, location: @portfolio }
    else
      format.html { render :new }
      format.json { render json: @portfolio.errors, status: :unprocessable_entity }
    end
  end
end

def edit
  @portfolio = Portfolio.find(params[:id])
end

# PATCH/PUT /portfolios/1
# PATCH/PUT /posrtfolios/1.json
def update
  @portfolio = Portfolio.find(params[:id])
  respond_to do |format|
    if @portfolio.update(params.require(:portfolio).permit(:title, :subtitle, :body))
      format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
      format.json { render :show, status: :ok, location: @portfolio }
    else
      format.html { render :edit }
      format.json { render json: @portfolio.errors, status: :unprocessable_entity }
    end
  end
end

def show
  @portfolio = Portfolio.find(params[:id])
end

# DELETE /portfolios/1
# DELETE /portfolios/1.json
def destroy
  @portfolio = Portfolio.find(params[:id])
  @portfolio.destroy
  respond_to do |format|
    format.html { redirect_to portfolios_url, notice: 'The portfolio was successfully deleted.' }
    format.json { head :no_content }
  end
end








end
