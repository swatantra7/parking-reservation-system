require 'rails_helper'

RSpec.describe ParkingReservation do

  context 'validations' do

    describe 'should validate presence' do
      it { should validate_presence_of(:color) }
      it { should validate_presence_of(:registration_no) }
    end

    describe 'should validate uniqness' do
      it { should validate_uniqueness_of(:registration_no) }
    end

  end

  context 'associations' do

    describe 'should belongs to parking_slot' do
      it { should belong_to(:parking_slot) }
    end

  end

end
