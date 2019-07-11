class ParkingSlot < ApplicationRecord

  include AASM

  has_one :parking_reservation


  aasm column: :status, whiny_transitions: false do

    state :avaliable, initial: true
    state :reserved

    event :reserve do
      transitions from: :avaliable, to: :reserved
    end

    event :free do
      transitions from: :reserved, to: :avaliable
    end


  end


end
