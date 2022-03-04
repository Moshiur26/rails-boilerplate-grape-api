# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

### Create Rails App
`rails new rails-boilerplate --database=postgresql`
 
### Add gem for rapid API development
```
gem 'grape'
gem 'grape-entity'
gem 'grape-kaminari'
gem 'grape_on_rails_routes'
gem 'devise'
gem 'devise-jwt'
```

### Devise configuration
* rails generate devise:install
* config.action_mailer.default_url_options = { host: 'localhost', port: 3000 } `add into config/environments/development.rb:`
* rails generate devise Admin
