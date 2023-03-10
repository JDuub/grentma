class User < ApplicationRecord
  has_many :grandmas
  has_many :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :grandmas, through: :bookings, dependent: :destroy
  has_one_attached :photo
#  validates :description, length: { minimum: 6 }
end
