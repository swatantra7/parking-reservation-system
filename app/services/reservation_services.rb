class ReservationServices

  class << self

    def create_parking_lot(no_of_slot)
      no_of_slot.to_i.times do
        ParkingSlot.create
      end
      "Created a parking lot with #{no_of_slot} slots"
    end

    def park(registration_no, color)
      nearest_free_slot = ParkingSlot.avaliable.first
      if nearest_free_slot.present?
        pr = nearest_free_slot.build_parking_reservation(registration_no: registration_no, color: color)
        if pr.save
          nearest_free_slot.reserve!
          "Allocated slot number: #{pr.parking_slot_id}"
        else
          "Parking Not Allocated Due to Errors #{pr.errors.full_messages.join(",")}"
        end
      else
        'Sorry, parking lot is full'
      end
    end

    def leave(slot_number)
      parking_slot = ParkingSlot.find_by(id: slot_number)
      if parking_slot.present?
        slot_reservation = parking_slot.parking_reservation
        if slot_reservation.present?
          slot_reservation.destroy
          parking_slot.free!
          "Slot Number #{slot_number} is free"
        else
          "Slot Number #{slot_number} is already free"
        end
      else
        'Slot Not avaliable'
      end
    end

    def status
      ParkingReservation.all
    end

    def registration_numbers_for_cars_with_colour(color)
      parking_reservation = ParkingReservation.color_eq(color)
      if parking_reservation.present?
        parking_reservation.pluck(:registration_no).join(',')
      else
        'Not found'
      end
    end

    def slot_numbers_for_cars_with_colour(color)
      parking_reservation = ParkingReservation.color_eq(color)
      if parking_reservation.present?
        parking_reservation.pluck(:parking_slot_id).join(',')
      else
        'Not Found'
      end
    end

    def slot_number_for_registration_number(registration_no)
      parking_reservation = ParkingReservation.find_by(registraion_no: registration_no)
      if parking_reservation.present?
        parking_reservation.parking_slot_id
      else
        'Not Found'
      end
    end

  end

end