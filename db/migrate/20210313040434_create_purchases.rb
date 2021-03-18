class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.integer :postal_code, null: false
      t.integer :prefecture_id, null: false
      t.text :municipality, null: false
      t.text :banch, null: false
      t.text :building_name
      t.text :telephone, null: false
      t.references :purchase_log, foreign_key: true
      t.timestamps

    end
  end
end
