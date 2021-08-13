class Property < ApplicationRecord
  belongs_to :account
  scope :newest, ->{order(created_at: :desc)}

  validates :name,
            presence: true,
            length: {maximum: Settings.property.max_length}

  validates :address,
            presence: true,
            length: {maximum: Settings.property.max_length}

  validates :price,
            presence: true,
            length: {maximum: Settings.property.max_length}

  validates :rooms,
            presence: true,
            length: {maximum: Settings.property.max_length}

  validates :bathrooms,
            presence: true,
            length: {maximum: Settings.property.max_length}
end
