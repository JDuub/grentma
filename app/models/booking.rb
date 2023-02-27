class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :grandma
  validates :grandma_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  
end
