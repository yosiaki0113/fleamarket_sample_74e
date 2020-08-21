class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses do |t|
      t.string :destination_family_name,          null: false
      t.string :destination_first_name,           null: false
      t.string :destination_family_name_kana,     null: false
      t.string :destination_first_name_kana,      null: false
      t.string :post_code,                       null: false
      t.integer :prefecture,                      null: false
      t.string :city,                             null: false
      t.string :house_number,                     null: false
      t.string :building_name
      t.string :phone
      t.references :user,                      foreign_key: true
      t.timestamps
    end
  end
end
