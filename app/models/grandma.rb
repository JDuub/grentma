class Grandma < ApplicationRecord
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :user_id, presence: true
  has_many :users, through: :bookings, dependent: :destroy
  has_one_attached :photo
  #validates :description, length: { minimum: 4 }
end
