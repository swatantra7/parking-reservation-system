# README

This README would normally document whatever steps are necessary to get the
application up and running.

Parking Reservation System is a Platform where you can manage your multi-storey parking lot.

# System Dependencies

* OS - Ubuntu 16.04/higher OR CentOS 6/7
* RVM
* Ruby 2.4.1
* Rails 5.2.3
* Git 2.16.3 or latest version
* DB- SqlLite

# App Setup

Execute following rake:
* rake parking_reservation:install RAILS_ENV=XXXX

This rake will execute all required DB migrations for App setup

# Config Files

Need to add following configuration files in directory app/config:
* config/secrets.yml

For more detail please check 'yml.example' in app directory.

Use following rake to generate secret keys -
* rake secrets

# Background Jobs

No background jobs added yet.

Rspec Report:

```
ParkingReservation
  validations
    should validate presence
      should validate that :color cannot be empty/falsy
      should validate that :registration_no cannot be empty/falsy
    should validate uniqness
      should validate that :registration_no is case-sensitively unique
  associations
    should belongs to parking_slot
      should belong to parking_slot

Finished in 0.13806 seconds (files took 1.77 seconds to load)
4 examples, 0 failures

```

# Usage

  * rake launch_app
