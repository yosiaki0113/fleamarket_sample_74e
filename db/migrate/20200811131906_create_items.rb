class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null:false
      t.text :text, null:false
      t.integer :price, null:false
      t.integer :condtion_id, null:false
      t.integer :prefecture_id, null:false
      t.integer :postage_type_id, null:false
      t.integer :days_until_shipping_id, null:false
      t.string :trading_status, null:false, default: "出品中"
      t.timestamp :purchase_date
      t.timestamp :close_date
      t.integer :seller_id, null:false
      t.integer :buyer_id
      t.string :brand
      t.timestamps
    end
  end
end
