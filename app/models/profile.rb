class Profile < ApplicationRecord
  belongs_to :user, optional: true
  validates :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_year, :birth_month, :birth_day, presence: true
  validates :family_name, :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角漢字・ひらがなで入力してください"}
  validates :birth_year, numericality: {only_integer: true, greater_than_or_equal_to: 1989, less_than_or_equal_to: 2020}
  validates :birth_month, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 12}
  validates :birth_day, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 31}
end
