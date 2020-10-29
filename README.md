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

heroku --version
heroku login
git push heroku master
heroku run pg:reset
heroku run rake db:migrate
heroku run rake db:seed
heroku restart
heroku run rails c
heroku logs -n 250