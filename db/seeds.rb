user = User.create!(
  email: "user@example.com",
  password: "123456",
  password_confirmation: "123456",
  confirmed_at: Time.zone.now
)

5.times do |i|
  apartment_args = {
    user: user,
    address: "Address #{i}",
    city: "City",
    zip_code: "11000",
    size: 100 * i,
    price: 15000 * i,
    bathroom_count: i,
    bedroom_count: i,
    floor: i
  }
  image_file_name = "property-1.jpg"

  apartment_for_sell = Apartment.new(
    **apartment_args,
    status: :for_sell
  )
  apartment_for_rent = Apartment.new(
    **apartment_args,
    status: :for_rent
  )

  apartment_for_sell.image.attach(
    io: File.open(Rails.root.join "db/images/#{image_file_name}"),
    filename: image_file_name
  )
  apartment_for_rent.image.attach(
    io: File.open(Rails.root.join "db/images/#{image_file_name}"),
    filename: image_file_name
  )

  apartment_for_sell.save!
  apartment_for_rent.save!
end
