class SnsCredential < ApplicationRecord
  belongs_to :user, optional: true
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  has_many :shipping_addresses, dependent: :destroy
end
