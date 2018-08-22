class PortfoliosController < ApplicationController

def index
  @portfolioItems = Portfolio.all
end

end
