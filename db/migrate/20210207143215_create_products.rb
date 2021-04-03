class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|

      t.timestamps
      t.string :product_name, null: false
      t.text :feature, null: false
      t.integer :price, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :send_charge_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :send_span_id, null: false
      t.references :user, foreign_key: true

    end
  end
end
