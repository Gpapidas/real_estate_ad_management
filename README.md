# README

### * Ruby version: 3.0.3

### * Rails version: 7.0.6

### * Configuration

    Can easily run on a localhost environment with Docker

### * How to run locally

    1. Clone this repository
    2. Rename .env.example to .env
    3. Run docker-compose build
    4. Run docker-compose up
    5. Website should be ready at http://0.0.0.0:3000

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
