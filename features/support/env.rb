# IMPORTANT: This file is generated by cucumber-rails - edit at your own peril.
# It is recommended to regenerate this file in the future when you upgrade to a
# newer version of cucumber-rails. Consider adding your own code to a new file
# instead of editing this one. Cucumber will automatically load all features/**/*.rb
# files.

require 'cucumber/rails'

# frozen_string_literal: true

# Capybara defaults to CSS3 selectors rather than XPath.
# If you'd prefer to use XPath, just uncomment this line and adjust any
# selectors in your step definitions to use the XPath syntax.
# Capybara.default_selector = :xpath

# By default, any exception happening in your Rails application will bubble up
# to Cucumber so that your scenario will fail. This is a different from how
# your application behaves in the production environment, where an error page will
# be rendered instead.
#
# Sometimes we want to override this default behaviour and allow Rails to rescue
# exceptions and display an error page (just like when the app is running in production).
# Typical scenarios where you want to do this is when you test your error pages.
# There are two ways to allow Rails to rescue exceptions:
#
# 1) Tag your scenario (or feature) with @allow-rescue
#
# 2) Set the value below to true. Beware that doing this globally is not
# recommended as it will mask a lot of errors for you!
#
ActionController::Base.allow_rescue = false

# Remove/comment out the lines below if your app doesn't have a database.
# For some databases (like MongoDB and CouchDB) you may need to use :truncation instead.
begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

def seed_cucumber_test_data
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
    price: 1_000_000.00,
    extra_description: "This is a beautiful luxury villa with stunning views."
  )

  PropertyAd.create(
    title: "Cozy Apartment",
    property_type: "Rent",
    property_ad_location_id: property_ad_location2.id,
    user_id: user.id,
    price: 300_000.00,
    extra_description: "A comfortable apartment in a prime location."
  )

  PropertyAd.create(
    title: "Beach House",
    property_type: "Rent",
    property_ad_location_id: property_ad_location1.id,
    user_id: second_user.id,
    price: 800_000.00,
    levels: 12,
    extra_description: "A charming beachfront property with direct access to the beach."
  )

  PropertyAd.create(
    title: "Testing Property",
    property_type: "Rent",
    property_ad_location_id: property_ad_location1.id,
    user_id: second_user.id,
    price: 800_000.00,
    levels: 12,
    extra_description: "A charming beachfront property with direct access to the beach."
  )
end

Before do
  seed_cucumber_test_data
end

Around do |_scenario, block|
  DatabaseCleaner.cleaning do
    block.call
  end
end

# You may also want to configure DatabaseCleaner to use different strategies for certain features and scenarios.
# See the DatabaseCleaner documentation for details. Example:
#
#   Before('@no-txn,@selenium,@culerity,@celerity,@javascript') do
#     # { except: [:widgets] } may not do what you expect here
#     # as Cucumber::Rails::Database.javascript_strategy overrides
#     # this setting.
#     DatabaseCleaner.strategy = :truncation
#   end
#
#   Before('not @no-txn', 'not @selenium', 'not @culerity', 'not @celerity', 'not @javascript') do
#     DatabaseCleaner.strategy = :transaction
#   end
#

# Possible values are :truncation and :transaction
# The :transaction strategy is faster, but might give you threading problems.
# See https://github.com/cucumber/cucumber-rails/blob/master/features/choose_javascript_database_strategy.feature
Cucumber::Rails::Database.javascript_strategy = :truncation
