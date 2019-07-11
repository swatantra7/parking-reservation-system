class CreateParkingReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :parking_reservations do |t|
      t.integer :parking_slot_id
      t.string :registration_no
      t.string :color

      t.timestamps
    end
    add_index :parking_reservations, :parking_slot_id
  end
end
