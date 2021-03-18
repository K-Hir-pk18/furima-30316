class PurchasesController < ApplicationController

  def index
  @purchase = Purchase.new
  @product = Product.find(params[:product_id])
  end

  def create
    purchase = Purchase.new(purchase_params)
    if @purachase.valid?
      @purchase.save
      redirect_to action: :index
    else
      render action: :index
    end
  end

  #カリキュラム
  #def create
    #user = User.create(user_params)
    #Address.create(address_params(user))
    #Donation.create(donation_params(user))
    #redirect_to action: :index
  #end

  private
# ここで各パラメータを取得するメソッド
  def purchase_params
      params.require(:purchase).permit(:postal_code, :prefecture_id, :municipality, :banch, :building_name, :telephone).merge(:prodcut_name, :feature, :price, :send_charge_id, user_id: current_user.id, product_id: params[:product_id])
    end
#purchase_logの取得はなし

    def purchase_log_params
      params.require(:purchase_log).merge(user_id: current_user.id, product_id: params[:product_id])
    end
end