class ProductsController < ApplicationController
  #before_action :set_products, only: [:edit, :show]

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  #def destroy
    #product = Product.find(params[:id])
    #product.destroy
  #end

  #def edit
  #end

  #def update
    #if current_user.update(product_params)
      #redirect_to root_path
    #else
      #render :edit
    #end
  #end

  #def show
  #end

private
  def product_params
    params.require(:product).permit(:product_name, :feature, :price, :image, :category_id ,:condition_id , :send_charge_id, :prefecture_id, :send_span_id).merge(user_id: current_user.id)
  end

  #def set_product
    #@product = produt.find(params[:id])
  #end

end
