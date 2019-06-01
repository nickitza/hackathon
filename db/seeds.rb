3.times do 
  trip = Trip.create(
    name: Faker::Address.country
  )
3.times do 
  location = Location.create(
    name: Faker::Address.state,
    days: Faker::Number.between(1, 30),
    trip_id: trip.id
  )
  3.times do
      address = Address.create(
          name: Faker::Company.name,
          street: Faker::Address.street_address,
          city: Faker::Address.city,
          state:Faker::Address.state ,
          zip: Faker::Address.zip_code,
          location_id: location.id

      )
      end
  end
end

puts "27 records seeded";