# README

### * Ruby version: 3.1.3

### * Rails version: 7.0.6

### * The project

    Real estate ad management is an application used for creating and managing property ads.
    A user can perform the whole CRUD operation for their property ads.
    Creation and editing happens by using a custom form.
    Area selection happens by consuming a third-party API which provides
    results for available areas, according to user's input.
    Code and documentation for this functionality can be found in the following
    files:

    - app/views/property_ads/new.html.erb
    - app/javascript/controllers/area_select_controller.js
    - app/controllers/property_ad_locations_controller.rb

### * IMPORTANT!

    Merging code into main branch will automatically deploy the changes
    to our production. Please make sure to check for github CI before merging
    to ensure that everything works fine!

    Also please check out the 'Before you commit' section, described below.

### * Production

    A production instance of this application can be found in
    the following link
    https://vast-earth-24288-c34e0ec7b1f0.herokuapp.com/

    Make sure to log in with one of the users described in 
    db/seeds.rb

### * How to run locally

    1. Clone this repository
    2. Rename .env.example to .env
    3. Run `yarn`
    4. Run `yarn build`
    5. Run `docker-compose build`
    6. Run `docker-compose up`
    7. Run `docker exec -it real_estate_ad_management_web_1 /bin/bash`
    8. Run `rails db:migrate`
    9. Run `rails db:seed to initialize the data`
    10. Website should be ready at http://0.0.0.0:3000

### * Changing JS

    If you are in development environment and want to make changes to the JS,
    you will probably not see the changes right away.
    You have to run the following command

    `docker exec -it real_estate_ad_management_web_1 /bin/bash`

    `yarn`

    In order to connect to the container and install packages, 
    and after that you can run either

    `yarn build`, to apply the changes

    or

    `yarn build --watch`, to continuously watch for changes and apply them
    while developing the app
 
### * Seeded data

    In the seeded data (described into db/seeds.rb) you will find Users,
    PropertyAds and PropertyAdLocations. You can log in with one of the 4
    users described in the file.

    Admins will have access to all properties, while regular users will have only
    to theirs.

### * Before you commit

    When you push or open a PR, github CI will run some tests to 
    verify that everything is in order.
    While this is not configured to prevent merges, even if these tests fail, 
    it provides an automated check so that the contributor can consult.

    Please before submitting a PR make sure that the following commands run 
    without errors to ensure that github CI passes.

    1. `bundle install`
    2. `bundle exec brakeman`
    3. `bundle exec bundle-audit check --update`
    4. `bundle exec rubocop`
    5. `Run the tests (see below)`

##### Run the tests

    We are using cucumber to run end-to-end tests, 
    in order to make sure everything runs correctly.
    Please run the following commands to run the tests for the first time.
    After creating and migrating the test db once, you do not have to do it again.

    1. RAILS_ENV=test rails db:create
    2. RAILS_ENV=test rails db:migrate
    3. bundle exec cucumber -s

##### Brakeman

    Brakeman is a static analysis tool which checks 
    Ruby on Rails applications for security vulnerabilities. 
    For more details please visit https://github.com/presidentbeef/brakeman

##### Bundler Audit

    Bundler Audit is a patch-level verification for bundler.
    For more details please visit https://github.com/rubysec/bundler-audit

##### Rubocop

    RuboCop is a Ruby static code analyzer (a.k.a. linter) and code formatter.
    For more details please visit https://github.com/rubocop/rubocop

### * Information about the packages we are using

##### Frontend

###### Selectize

    Selectize is an extensible jQuery-based custom <select>; UI control. It's useful for tagging, contact lists, country selectors, and so on. The goal is to provide a solid & usable experience with a clean and powerful API. See more here: https://github.com/selectize/selectize.js

    Selectize is being used on the create property form, coupled with
    Stimulus and jQuery, to handle the API call for the Area Selection.

##### Backend Gems

###### Annotate

    Annotate is being used to add a comment summarizing 
    the current schema to the top or bottom of each of 
    our ActiveRecord models. 
    See more here: https://github.com/ctran/annotate_models

###### Devise

    Devise is a gem being used to add user functionality in our application.
    See more here: https://github.com/heartcombo/devise

###### Httparty

    Httparty is being used to make the needed API call to get the 
    Area data we need for our form.
    See more here: https://github.com/jnunemaker/httparty

###### jsbundling-rails

    JavaScript Bundling for Rails provides installers to get 
    you going with the bundler of your choice in a new Rails application.
    See more here: https://github.com/rails/jsbundling-rails

###### Carrierwave / fog-aws

    These two gems are being used together in order to 
    enable image uploading with AWS s3 storage.
    See more here (carrierwave): https://github.com/carrierwaveuploader/carrierwave
    See more here (fog-aws): https://github.com/fog/fog-aws

###### Bullet

    Bullet is being used during development to help us deal with N+1 queries issues.
    See more here: https://github.com/flyerhzm/bullet
