class Property < ApplicationRecord
  belongs_to :account
  scope :newest, ->{order(created_at: :desc)}

  validates :name, presence: true, length: {maximum: 140}
  validates :address, presence: true, length: {maximum: 140}
  validates :price, presence: true, length: {maximum: 140}
  validates :rooms, presence: true, length: {maximum: 140}
  validates :bathrooms, presence: true, length: {maximum: 140}
end
