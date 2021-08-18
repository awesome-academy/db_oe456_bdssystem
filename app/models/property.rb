class Property < ApplicationRecord
  belongs_to :account

  scope :newest, ->{order(created_at: :desc)}
  scope :agent_property, ->(property_id, agent_id){where(account_id: agent_id).where.not(id: property_id)}

  has_one_attached :photo
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

  validates :photo, content_type: {
    in: Settings.property.image_format_validation,

    message: I18n.t("image_validates.must_valid_image_format")
  },
    size: {
      less_than: Settings.account.image_max_size.megabytes,
      message: I18n.t("image_validates.image_size_less_than"),
      max_size: Settings.account.image_max_size
    }

  def display_photo
    photo.variant resize_to_limit: [500, 500]
  end
end
