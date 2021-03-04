class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :send_charge
  belongs_to :prefecture
  belongs_to :send_span
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :product_name
    validates :feature
    validates :price
    validates :image
    validates :category_id
    validates :condition_id
    validates :send_charge_id
    validates :prefecture_id
    validates :send_span_id
  end

  validates :price, numericality: { only_integer: true, message: "is invalid. Input half-width characters." }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range" }

  #可読性アップ
  #validates :category_id, numericality: { other_than: 0, message: "can't be blank" }
  #alidates :condition_id, numericality: { other_than: 0, message: "can't be blank" }
  #validates :send_charge_id, numericality: { other_than: 0, message: "can't be blank" }
  #validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  #validates :send_span_id, numericality: { other_than: 0, message: "can't be blank" }
  #可読性アップ

  with_options numericality: { other_than: 0, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :send_charge_id
    validates :prefecture_id
    validates :send_span_id
  end

end
