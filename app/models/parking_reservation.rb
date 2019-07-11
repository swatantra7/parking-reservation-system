class ParkingReservation < ApplicationRecord

  # track a previous logs of reservations
  audited on: [:destroy]

  validates :color, presence: true
  validates :registration_no, presence: true, uniqueness: true

  belongs_to :parking_slot

  scope :color_eq, ->(color){ where(color: color)}

end
