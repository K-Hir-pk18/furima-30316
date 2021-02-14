class ProductsController < ApplicationController

  def index
    @prodcuts = Products.all
  end

  def new
  end

  

end
