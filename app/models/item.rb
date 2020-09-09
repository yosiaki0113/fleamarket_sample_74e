class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condtion
  belongs_to_active_hash :days_until_shipping
  belongs_to_active_hash :postage_type

  belongs_to :seller, class_name: "User", foreign_key: "seller_id"
  belongs_to :buyer, class_name: "User", foreign_key: "buyer_id", optional: true
  belongs_to :category
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :images, presence: {message: 'がありません'}
  validates :name, 
            :text,
            :price, 
            :condtion_id, 
            :prefecture_id, 
            :postage_type_id, 
            :days_until_shipping_id,
            :category_id,  presence: true

  belongs_to :user, optional: true
  has_many :likes, dependent: :destroy
  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end
  
  def previous
    Item.where("id < ?", self.id).order("id DESC").first
  end
          
  def next
    Item.where("id > ?", self.id).order("id ASC").first
  end
end