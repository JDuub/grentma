class Grandma < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :user_id, presence: true
  has_many :users, through: :bookings, dependent: :destroy
  has_one_attached :image_url
  has_many_attached :feed_photos, dependent: :destroy
  # validates :description, length: { minimum: 6 }
  #  validates :feed_photos, presence: true, length: { is: 3 }, format: { with: /\A(https?:\/\/.+\.([a-z]+\.)?[a-z]{2,}\/?.*\.jpg|jpeg|png)\z/i }, if: Proc.new { |g| g.feed_photos.present? }

#
end
