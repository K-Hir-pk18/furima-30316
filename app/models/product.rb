class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :send_charge
  belongs_to :prefecture
  belongs_to :send_span

    #空の投稿を保存できないようにする
  validates :price, numericality: { only_integer: true, message: "is invalid. Input half-width characters." }
  #'カテゴリー'、'商品状態'、'発送料の負担'、'発送元の地域'、'発送までの日数'の選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :send_charge_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :send_span_id, numericality: { other_than: 0, message: "can't be blank" }

  # 「寄付金」の金額範囲に関するバリデーション
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range" }
end



end
