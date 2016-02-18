# My personal website

## Summary
A ruby on rails application used to house my public professional information. This application uses bootstrap with bootswatch theme, coffeescript and sass.

## Dependencies
* Rails 4.2.x
* Ruby 2.2.2
* Twitter developer account to post updates
* An application.yml file in the config directory with all of the environment variables needed for the application to run

## Features
* Blog w/ trix editor, file upload, twitter and tinyurl integration
* Blog comments send an email notification
* Creating messages send an email notification

## How to Run
### Development
Clone this repo
```
https://github.com/vmcilwain/vell.git
```

Cd into the application directory
```
cd vell
```

Run the rails server
```ruby
rails s
```

### Production
Uses capistrano
```ruby
cap [environment] deploy
```

# Testing
```ruby
rspec
```
Code coverage is done by SimpleCov. After running rspec view the coverage/index.html file to see test coverage.

##Data Model:
View the erd.pdf file in the root directory