class PurchasesController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    if user_signed_in? == false
      redirect_to user_session_path
    elsif current_user.id == @product.user_id
      redirect_to root_path
    elsif !@product.purchase_log.nil?
      redirect_to root_path
    else
      @purchase_form = PurchaseForm.new
      end
  end

  def create
    @purchase_form = PurchaseForm.new(purchase_form_params)
    @product = Product.find(params[:product_id])
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
end
