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

### Rails 7 replaced byebug with ruby/debug
`instead of byebug use binding.break`

### Create Rails App
`rails new rails-boilerplate --database=postgresql`

### Add gem for rapid API development
```
# To handle api
gem 'grape'
gem 'grape-entity'
gem 'grape-kaminari'
gem 'grape_on_rails_routes'

# To handle user authentication
gem 'devise'
gem 'devise-jwt'

# For cross-origin requests
gem 'rack-cors', '~> 1.1.1'
```

### Devise configuration
* rails generate devise:install
* config.action_mailer.default_url_options = { host: 'localhost', port: 3000 } `add into config/environments/development.rb:`
* rails generate devise Admin

### Rake-Cors configuration
* Create new file cors.rb into config/initializers
* Make configuration into cors.rb to give access require methods & headers
