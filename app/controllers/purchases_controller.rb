class PurchasesController < ApplicationController

  def index
  @purchase_form = PurchaseForm.new
  @product = Product.find(params[:product_id])
  end

  def create
    @purchase_form = PurchaseForm.new(purchase_form_params)
    @product = Product.find(params[:product_id])
    if @purchase_form.valid?
      @purchase_form.save
      redirect_to action: :index
    else
      render :index
    end
  end

  private
  def purchase_form_params
    params.require(:purchase_form).permit(:postal_code, :prefecture_id, :municipality, :banch, :building_name, :telephone).merge(product_id: params[:product_id], user_id: current_user.id, token: params[:token], )
  end
end