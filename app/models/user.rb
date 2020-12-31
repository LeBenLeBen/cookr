class User < ApplicationRecord
  ROLES = %w[admin author]

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable,
         :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  has_many :recipes, dependent: :destroy

  validates :role, inclusion: { in: ROLES }
  validates :username,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { in: 2...31 },
            format: {
              with: /\A[a-zA-Z0-9_.\-]+\z/,
              message:
                I18n.t(
                  'activerecord.errors.models.user.attributes.username.format'
                )
            }

  before_validation(on: :create) do
    unless self.username.present?
      self.username = "user-#{rand(10_000...99_999)}"
    end
  end

  def admin?
    self.role === 'admin'
  end

  def generate_jwt
    JWT.encode(
      { id: id, exp: 60.days.from_now.to_i },
      Rails.application.secrets.secret_key_base
    )
  end
end
