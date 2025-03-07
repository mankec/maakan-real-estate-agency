user = User.create!(
  email: "user@example.com",
  password: "123456",
  password_confirmation: "123456",
  confirmed_at: Time.zone.now
)

5.times do |i|
  image_file_name = "property-1.jpg"

  property_args = {
    user: user,
    region: "Region #{i}",
    city: "City",
    zip_code: "10000",
    address: "Address #{i}",
    size: 100 * i,
    price: 15000 * i
  }

  property_apartment_for_sell = Property.create!(
    **property_args,
    status: :for_sell
  )
  property_apartment_for_rent = Property.create!(
    **property_args,
    status: :for_rent
  )
  property_villa_for_sell = Property.create!(
    **property_args,
    status: :for_sell
  )
  property_villa_for_rent = Property.create!(
    **property_args,
    status: :for_rent
  )

  apartment_args = {
    bathroom_count: i,
    bedroom_count: i,
    floor: i
  }
  villa_args = {
    bathroom_count: i,
    bedroom_count: i
  }

  apartment_for_sell = Apartment.create!(
    property: property_apartment_for_sell,
    **apartment_args
  )
  apartment_for_rent = Apartment.create!(
    property: property_apartment_for_rent,
    **apartment_args
  )
  villa_for_sell = Villa.create!(
    property: property_villa_for_sell,
    **villa_args
  )
  villa_for_rent = Villa.create!(
    property: property_villa_for_rent,
    **villa_args
  )

  apartment_for_sell.property.image.attach(
    io: File.open(Rails.root.join "db/images/#{image_file_name}"),
    filename: image_file_name
  )
  apartment_for_rent.property.image.attach(
    io: File.open(Rails.root.join "db/images/#{image_file_name}"),
    filename: image_file_name
  )
  villa_for_sell.property.image.attach(
    io: File.open(Rails.root.join "db/images/#{image_file_name}"),
    filename: image_file_name
  )
  villa_for_rent.property.image.attach(
    io: File.open(Rails.root.join "db/images/#{image_file_name}"),
    filename: image_file_name
  )
end
