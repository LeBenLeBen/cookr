class User < ApplicationRecord

  ROLES = %i[admin author]

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :recipes

  validates :role, inclusion: { in: ROLES }


  def admin?
    self.role === "admin"
  end

end
