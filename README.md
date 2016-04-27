# super_shoes
## Synopsis

Super shoes is a back-end application exposing REST services and an admin mini site for a shoe store. The purpose of this app was to be tested by the fine people at Growth Acceleration Partners.

## What does this app do?
This app features CRUD for managing two DB tables: Stores and Articles. It also exposes three REST services that list data from these tables. These REST services are protected by Basic HTTP Authentication. 

### Usage
The admin mini site is very easy to navigate through. From `http://localhost:3000/` you'll access the Main menu. From there CRUD management views for Stores and Articles are accesible.

REST services are exposed as listed below:
* http://localhost:3000/services/stores (List all stores)
* http://localhost:3000/services/articles (List all articles)
* http://localhost:3000/services/articles/stores/STORE_ID (List all articles for certain store)
These REST services are protected by HTTP Basic Authentication. Make sure your requests are sent with an authorization field in its header and a Base64 encoded string of both username and password separated by a colon (:). 
* Example: `Authorization: Basic QWxhZGRpbjpPcGVuU2VzYW1l` (where this string is username:password encoded).
The username is `my_user` and password `my_password`.

## Installation
### Prerequisites
* Developed with Ruby v.2.2.3
* Rails 4.2.6
* MySQL 5.5.x

### Setup
* Download to your machine.
* Run `rake db:setup`. Or if you prefer, `rake db:create, db:migrate, and db:seed` individually.
* Make sure you run `rake db:seed RAILS_ENV=test` because we need that seed data in our test database for Capybara testing purposes.
* Start your Rails server and open up `http://localhost:3000/` in your browser. Change your port accordingly.
* RSPEC tests are located in the following directories:
  * /spec/controllers/stores_controller_spec.rb (REST service testing)
  * /spec/features/articles_spec.rb (Capybara test for adding articles belonging to a store)
  * /spec/features/stores_spec.rb (Capybara test for adding stores)
  * /spec/models/store_spec.rb (Form validation testing)

