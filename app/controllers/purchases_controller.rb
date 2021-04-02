class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :edit_judge, only: [:index, :create]
  before_action :create_instance, only: [:index, :create]

  def index
  end

  def create
    if @purchase_form.valid?
        @purchase_form.save
        redirect_to root_path
    else
        render :index
    end
  end

  private

  def purchase_form_params
    params.require(:purchase_form).permit(:postal_code, :prefecture_id, :municipality, :banch, :building_name, :telephone).merge(product_id: params[:product_id], user_id: current_user.id, token: params[:token])
  end

  def edit_judge
    if current_user.id == @product.user_id
      redirect_to root_path
    else !@product.purchase_log.nil?
      redirect_to root_path
    end
  end
  
  def create_instance
    @purchase_form = PurchaseForm.new(purchase_form_params)
    @product = Product.find(params[:product_id])
  end
end
