# rake parking_reservation:install RAILS_ENV=xxxx

namespace :parking_reservation do

  task install: :environment do
    Rake::Task['db:migrate'].invoke
    puts 'Parking Reservation System Installed'
  end

end