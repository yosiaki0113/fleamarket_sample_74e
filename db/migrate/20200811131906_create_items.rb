class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null:false
      t.text :text, null:false
      t.integer :price, null:false
      t.string :condtion, null:false
      t.string :prefectures, null:false
      t.string :postage_type, null:false
      t.string :days_until_shipping, null:false
      t.string :trading_status
      t.timestamp :purchase_date
      t.timestamp :close_date
      t.integer :seller_id, null:false
      t.integer :buyer_id
      t.timestamps
    end
  end
end
