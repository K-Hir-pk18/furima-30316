class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_param, only: [:show, :edit, :update, :destroy]
  before_action :confirm_user, only: [:edit, :update, :destroy]
  before_action :after_purchase_restriction, only: [:edit, :update, :destroy]

  def index
    @products = Product.all.order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def show
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @product.update(product_params)
    if @product.save
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :feature, :price, :image, :category_id, :condition_id, :send_charge_id, :prefecture_id, :send_span_id).merge(user_id: current_user.id)
  end

  def find_param
    @product = Product.find(params[:id])
  end

  def confirm_user
    redirect_to action: :index if current_user.id != @product.user_id
  end

  def after_purchase_restriction
    if !@product.purchase_log.nil?
      redirect_to root_path
    end
  end
end
