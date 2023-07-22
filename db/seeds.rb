# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

user = User.create(
    {
        email: "user@ream.com", 
        password: "123456", 
        password_confirmation: "123456"
    }
)

second_user = User.create(
  {
      email: "seconduser@ream.com", 
      password: "123456", 
      password_confirmation: "123456"
  }
)

User.create(
  {
      email: "noproperties@ream.com", 
      password: "123456", 
      password_confirmation: "123456"
  }
)

User.create(
  {
      email: "admin@ream.com", 
      admin: true,
      password: "123456", 
      password_confirmation: "123456"
  }
)

# Create PropertyAdLocations
property_ad_location1 = PropertyAdLocation.create(
  place_id: "123456",
  area_main_text: "Main Area 1",
  area_secondary_text: "Secondary Area 1"
)
  
property_ad_location2 = PropertyAdLocation.create(
  place_id: "789012",
  area_main_text: "Main Area 2",
  area_secondary_text: "Secondary Area 2"
)

# Create PropertyAds
PropertyAd.create(
  title: "Luxury Villa",
  property_type: "Rent",
  property_ad_location_id: property_ad_location1.id,
  user_id: user.id,
  price: 1000000.00,
  extra_description: "This is a beautiful luxury villa with stunning views."
)

PropertyAd.create(
  title: "Cozy Apartment",
  property_type: "Rent",
  property_ad_location_id: property_ad_location2.id,
  user_id: user.id,
  price: 300000.00,
  extra_description: "A comfortable apartment in a prime location."
)

PropertyAd.create(
  title: "Beach House",
  property_type: "Rent",
  property_ad_location_id: property_ad_location1.id,
  user_id: second_user.id,
  price: 800000.00,
  extra_description: "A charming beachfront property with direct access to the beach."
)

PropertyAd.find_each(&:save)
