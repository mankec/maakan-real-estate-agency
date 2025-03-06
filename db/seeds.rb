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
  apartment_args = {
    bathroom_count: i,
    bedroom_count: i,
    floor: i
  }
  villa_args = {
    bathroom_count: i,
    bedroom_count: i
  }

  property_apartment_for_sell = Property.new(
    **property_args,
    status: :for_sell,
    property_type: :apartment
  )
  property_apartment_for_rent = Property.new(
    **property_args,
    status: :for_rent,
    property_type: :apartment
  )
  property_villa_for_sell = Property.new(
    **property_args,
    status: :for_sell,
    property_type: :villa
  )
  property_villa_for_rent = Property.new(
    **property_args,
    status: :for_rent,
    property_type: :villa
  )

  property_apartment_for_sell.attach_image
  property_apartment_for_rent.attach_image
  property_villa_for_sell.attach_image
  property_villa_for_rent.attach_image

  property_apartment_for_sell.save!
  property_apartment_for_rent.save!
  property_villa_for_sell.save!
  property_villa_for_rent.save!

  Apartment.create!(
    property: property_apartment_for_sell,
    **apartment_args
  )
  Apartment.create!(
    property: property_apartment_for_rent,
    **apartment_args
  )
  Villa.create!(
    property: property_villa_for_sell,
    **villa_args
  )
  Villa.create!(
    property: property_villa_for_rent,
    **villa_args
  )
end
