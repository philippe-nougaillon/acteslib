class User < ApplicationRecord
  audited
  has_many :demandes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
        # :registerable,
        # :recoverable,
        :rememberable,
        :trackable
        # :validatable

  enum role: {
    demandeur: 0,
    utilisateur: 1,
    institution: 2,
    administrateur: 3
  }

  def role_number
    User.roles[self.role]
  end
end
