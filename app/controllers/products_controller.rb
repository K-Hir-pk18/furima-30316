class ProductsController < ApplicationController
  before_action :set_products, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
  end

  #def new
    #@product = Product.new
  #end

  #def create
    #Product.create(product_params)
  #end

  #def destroy
    #product = Product.find(params[:id])
    #product.destroy
  #end

  #def edit
  #end

  #def update
    #prodcut = Prodcut.find(params[:id])
    #product.update(product_params)
  #end

  #def show
  #end

  #private
  #def proruct_params
    #params.require(:tweet).permit(:name, :image, :text)
  #end

  #def set_product
    #@product = produt.find(params[:id])
  #end

  #def move_to_index
    #unless user_signed_in?
      #redirect_to action: :index
    #end
  #end
end
