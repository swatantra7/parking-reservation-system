task :action do
  puts "Please Enter Commands, Type exit to exit from app"
  input = STDIN.gets.strip
  unless input == 'exit'
    execute_command(input)
    Rake::Task["action"].reenable
    Rake::Task["action"].invoke
  end
end

task launch_app: :environment do
  STDOUT.puts "Welcome to Parking Reservation System!!!\nPlease Press y to continue or Other key To Exit From This App"
  input = STDIN.gets.strip
  if input == 'y'
    puts "Successfully Logged In"
    puts instructions
    Rake::Task["action"].reenable
    Rake::Task["action"].invoke
  else
    puts "Bye Bye!!!"
  end
end

def execute_command(input)
  input = input.split
  method = input[0]
  arguments = input[1..input.length-1]
  if ['registration_numbers_for_cars_with_colour', 'slot_numbers_for_cars_with_colour', 'slot_number_for_registration_number', 'leave', 'create_parking_lot'].include?(method)
    argument =  arguments[0]
    response = ReservationServices.send(method, argument)
    puts response
  elsif method == 'park'
    response = ReservationServices.send(:park, arguments[0], arguments[1])
    puts response
  elsif method == 'status'
    response = ReservationServices.send(:status)
    puts format_status_response(response)
  else
    puts 'Oops Command Not Found!! Please try Again'
  end
end

def instructions
  <<-instruction
===========================================================
1.To Create ParkingLot: create_parking_lot no_of_parking
2.To Park the Car: park registration_number, colors
3.To Leave: leave slot_number
4.For Status: status
5.To Find registration_number from color: registration_numbers_for_cars_with_colour color
6.To Find slot_number from color: slot_numbers_for_cars_with_colour color
7.To Find slot_number_for_registration_number registration_number
===========================================
  instruction
end

def format_status_response(response)
  formatted_response = ''
  response.each do |res|
    formatted_response << "#{res.parking_slot_id},#{res. registration_no} #{res.color}\n"
  end
  <<-status_response
Slot No, Registration No, Color
================================
#{formatted_response}
  status_response
end