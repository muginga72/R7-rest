class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # -------- update ------------
  validates :email, presence: true, uniqueness: true, email: true
  validates :password, password_strength: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
