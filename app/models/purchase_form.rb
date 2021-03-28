class PurchaseForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :banch, :building_name, :telephone, :user_id, :product_id, :token

#purchase validates
#banchのvalidatesも

with_options presence: true do
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :municipality#, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ }
  validates :banch#, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ }
  validates :telephone, length: { in: 10..11}
  validates :telephone, format: { with: /\A[0-9]+\z/}  
  validates :token
end

  def save
    @purchase_log =  PurchaseLog.create(user_id: user_id, product_id: product_id)
    Purchase.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, banch: banch, building_name: building_name, telephone: telephone, purchase_log_id: @purchase_log.id)
    @product = Product.find(product_id)
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      card: token,
      currency: 'jpy'
    )
  end
end
