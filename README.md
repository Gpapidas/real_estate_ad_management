# README

### * Ruby version: 3.0.3

### * Rails version: 7.0.6

### * How to run locally

    1. Clone this repository
    2. Rename .env.example to .env
    3. Run docker-compose build
    4. Run docker-compose up
    5. Run docker exec -it real_estate_ad_management_web_1 /bin/bash
    6. Run rails db:migrate
    7. Run rails db:seed to initialize the data
    8. Website should be ready at http://0.0.0.0:3000

### * Seeded data

    In the seeded data (described into db/seeds.rb) you will find Users,
    PropertyAds and PropertyAdLocations. You can log in with one of the 4
    users described in the file.

    Admins will have access to all properties, while regular users will have only
    to theirs.

### * Before you commit

    Please before submitting a PR make sure that the following commands run without errors

    1. docker run -it --rm real_estate_ads_web bundle exec brakeman
    2. docker run -it --rm real_estate_ads_web bundle exec bundle-audit check --update
    3. docker run -it --rm real_estate_ads_web bundle exec rubocop

###### Brakeman

    Brakeman is a static analysis tool which checks Ruby on Rails applications for security vulnerabilities. 
    For more details please visit https://github.com/presidentbeef/brakeman

###### Bundler Audit

    Bundler Audit is a patch-level verification for bundler.
    For more details please visit https://github.com/rubysec/bundler-audit

###### Rubocop

    RuboCop is a Ruby static code analyzer (a.k.a. linter) and code formatter.
    For more details please visit https://github.com/rubocop/rubocop
