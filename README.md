# Source Hero
## Source Hero is an online community for sharing your favorite web resources/bookmarks.

##Setup and Configuration

##Ruby v. 2.3.3 Rails v. 4.2.5 Databases: SQLite (Test, Development), PostgreSQL (Production)

##Gems Used:

Factory Girl - Development
Bootstrap - styling
Bcrypt - data encryption
Figaro - environmental variables
Rspec - TDD
Devise - Authentication
Pundit - Authorization
Faker - Seed data
Pundit-matchers - Pundit specs

##Set-up:

Environmental variables were secured using Figaro and are stored in config/application.yml (ignored by GitHub).
The config/application.example.yml illustrates the formatting for environmental variables.

##To run Soure Hero locally:

Clone the repository
Run `bundle install`
Create and migrate the SQLite database with `rake db:create` and `rake db:migrate`
Start the server using `rails s`
Run the app on localhost:3000
Things you may want to cover:
