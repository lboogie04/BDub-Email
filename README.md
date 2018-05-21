# README

This README would normally document whatever steps are necessary to get the
application up and running.

## Installation

Intallation includes your basic Rails project setup:
```ruby
bundle install
rails s
```
Create a `.env` file for environment variables.
Postman is used for testing Post request to `/email`.

Minitest is used for test so running `rake test` should run the test.


## Reason for Rails

* #### Validation ease
  Validation helper methods in Rails make it easy to get a model up and going and include its validations(i.e. `validates` method, etc.)

* #### Object Orient-ation
  Rails, being the flexible architecture it is, provides various strategies for a more Object Oriented interface such as `services`, `collections` and event creating your own models without `rails generate`. Its like having the best of both worlds.

* #### Convention over Configuration
  Its a pretty popular advantage in Rails. But as it pertains to this project, it takes no time at all(and very few files to touch) to get such a `POST` request up and going.

* #### Test Driven "Dynamic-ness"
  Ruby, being a dynamic language, provides the ease of use and flexibility to not only write production code but implement to the tests that tag along with them in an organized Rails-like directory structure. Perfect for TDD!
  
## Etc, etc.
  
* Could possibly refactor some of the actual mailing services down more through extraction.

* Could have added more unit testing for the individual email services(sendgrid, etc.)

* Failed to add the flexibility to switch the order of the mailing services. (MailGun will always be tried first). Also, could have wrote a better way to catch errors for the `send_email` method in the `MailerService` class.

* No error catching for invalid Api Keys(other than status: 500)
  
