# Source Hero
## Source Hero is an online community for sharing your favorite web resources/bookmarks.

## Features
- Users can sign up for an account and create topics to store online resources in accordingly
- Users can can name each resource to preference
- Users can like resources of other users to store in their personal profile
- Users can edit and delete resources that belong to them
- Users can create a resource for their account by sending the app an email (this is configured through Mailgun), where the subject of the email is the topic, and the body of the email is the resource iteself.

## Setup and Configuration
**Ruby v. 2.3.3**
**Rails v. 4.2.5**
**Databases:** SQLite (Test, Development), PostgreSQL (Production)

**Gems Used:**

- *Factory Girl* - Development
- *Bootstrap* - Styling
- *Bcrypt* - data encryption
- *Figaro* - environmental variables
- *Rspec* - TDD
- *Devise* - Authentication
- *Pundit* - Authorization
- *Faker* - Seed data
- *Pundit-matchers* - Pundit specs

**Set-up:**

Environmental variables were secured using Figaro and are stored in config/application.yml (ignored by GitHub).
The config/application.example.yml illustrates the formatting for environmental variables.

**To run Source Hero locally:**

1. Clone the repository
2. Run `bundle install`
3. Create and migrate the SQLite database with `rake db:create` and `rake db:migrate`
4. Start the server using `rails s`
5. Run the app on localhost:3000
