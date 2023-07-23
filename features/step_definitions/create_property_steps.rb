Given("I am on the login page") do
  visit new_user_session_path
end

When("I log in with valid credentials") do
  fill_in 'Email', with: 'user@ream.com'
  fill_in 'Password', with: '123456'
  click_button 'Log in'
end

Then("I navigate to the create form page") do
  visit new_property_ad_path
end

And("I should see the form page") do
  expect(page).to have_content("New Property")
end

And("I fill out the create form with valid data") do
  fill_in 'Title', with: 'Testing Property'
  select 'Rent', from: 'Type'
  find('input[name="property_ad[property_ad_location[place_id]]"]', visible: :all).set('123456')
  find('input[name="property_ad[property_ad_location[area_main_text]]"]', visible: :all).set('Main Area 1')
  find('input[name="property_ad[property_ad_location[area_secondary_text]]"]', visible: :all).set('Secondary Area 1')
  fill_in 'Price in Euros', with: '123.85'
end

And("I submit the form") do
  click_button 'Submit'
end

Then("I navigate to my properties page") do
  visit property_ads_path
end

And("I should see the newly created property") do
  expect(page).to have_content('Testing Property')
end
