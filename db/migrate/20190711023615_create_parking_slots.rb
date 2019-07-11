class CreateParkingSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :parking_slots do |t|
      t.string :status

      t.timestamps
    end
  end
end
