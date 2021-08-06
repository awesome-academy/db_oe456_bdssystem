class Account < ApplicationRecord
  before_save :downcase_email

  scope :newset, ->{order(created_at: :desc)}

  VALID_EMAIL_REGEX = Settings.account.email.valid_email_regex
  validates :last_name,
            presence: true,
            length: {maximum: Settings.account.name.max_length}
  validates :fitst_name,
            presence: true,
            length: {maximum: Settings.account.name.max_length}
  validates :email,
            presence: true, uniqueness: true,
            format: {with: VALID_EMAIL_REGEX},
            length: {maximum: Settings.account.email.max_length}
  validates :password, presence: true,
            length: {minimum: Settings.account.password.min_length}

  has_secure_password

  def self.digest string
    cost =  if ActiveModel::SecurePassword.min_cost
              BCrypt::Engine::MIN_COST
            else
              BCrypt::Engine.cost
            end
    BCrypt::Password.create string, cost: cost
  end

  private

  def downcase_email
    email.downcase!
  end
end
