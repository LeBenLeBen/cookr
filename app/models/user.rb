class User < ApplicationRecord

  ROLES = %w[admin author]

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable,
         :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :recipes

  validates :role, inclusion: { in: ROLES }


  def admin?
    self.role === "admin"
  end

end
