Class PurchaseForm

    include ActiveModel::Model
    attr_accessor (:postal_code, :prefecture_id, :municipality, :banch, :building_name, :telephone, :user_id, :product_id).merge(user_id: current_user.id, product_id: params[:product_id])

#手順3.保存したい複数のテーブルのカラム名全てを属性値として扱えるようにする
#手順4.バリデーションの処理を書く
#手順5.データをテーブルに保存する処理を書く
#手順6.コントローラーのnewアクション、createアクションでFormオブジェクトのインスタンスを生成するようにする
#手順7.フォーム作成の部分をFormオブジェクトのインスタンスを引数として渡す形に変更する

#purchase validates
validates :building_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ }

with_options presence: true do
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :municipality, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ }
  validates :banch, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ }
  validates :telephone, length: { in: 10..11}
  validates :telephone, format: { with: /\A[0-9]+\z/}  
end

# ここで全てのパラメータを取得するメソッド
  def save
    purchase = Purchase.create(postal_code :postal_code, prefecture_id :prefecture_id, municipality :municipality, banch :banch, building_name :building_name, telephone :telephone)
    purchase_log.create(user_id :user_id, product_id :product_id)
  end
end