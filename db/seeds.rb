def property_args(user = User.first, i)
  {
    user: user,
    region: "Region #{i}",
    city: "City",
    zip_code: "10000",
    address: "Address #{i}",
    size: 100 * i,
    price: 15000 * i
  }
end

def apartment_args(i)
  {
    bathroom_count: i,
    bedroom_count: i,
    floor: i
  }
end

def villa_args(i)
  {
    bathroom_count: i,
    bedroom_count: i
  }
end

User.create!(
  email: "user@example.com",
  password: "123456",
  password_confirmation: "123456",
  confirmed_at: Time.zone.now
)

3.times do |i|
  property_apartment_featured = Property.new(
    **property_args(i),
    status: :featured,
    property_type: :apartment
  )
  property_villa_featured = Property.new(
    **property_args(i),
    status: :featured,
    property_type: :apartment
  )

  property_apartment_featured.attach_image
  property_villa_featured.attach_image

  property_apartment_featured.save!
  property_villa_featured.save!

  Apartment.create!(
    property: property_apartment_featured,
    **apartment_args(i)
  )
  Villa.create!(
    property: property_villa_featured,
    **villa_args(i)
  )
end

5.times do |i|
  property_apartment_for_sell = Property.new(
    **property_args(i),
    status: :for_sell,
    property_type: :apartment
  )
  property_apartment_for_rent = Property.new(
    **property_args(i),
    status: :for_rent,
    property_type: :apartment
  )
  property_villa_for_sell = Property.new(
    **property_args(i),
    status: :for_sell,
    property_type: :villa
  )
  property_villa_for_rent = Property.new(
    **property_args(i),
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
    **apartment_args(i)
  )
  Apartment.create!(
    property: property_apartment_for_rent,
    **apartment_args(i)
  )
  Villa.create!(
    property: property_villa_for_sell,
    **villa_args(i)
  )
  Villa.create!(
    property: property_villa_for_rent,
    **villa_args(i)
  )
end
