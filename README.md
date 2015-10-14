#Vextranet Website

##Summary
This is my business extranet site that will house content about me as it relates to my web development profession.

##Current Phase:
Phase  | Status
------------- | -------------
Design  | Done
Coding  | In Progress
Released | Not Yet

###Processes:
No processes yet

##Data Model:
View the erd.pdf file in the root directory

##Using the Application:
###Development
```
rails s
```
from the root directory

###Testing
```
rspec
```
from the root directory

###Production
Production will be deployed on Heroku.

###Technical Stuff:  
* Ruby Version: 2.0.0
* Rails Version: 4.2.0
* Dependencies:
 * Twitter
 * Google URL Shortner
* Confirguration: 
 * Development and Test Database: mysql
 * Production Database: Postgres
 * Twitter Gem environment variables:
  * CONSUMER_KEY
  * CONSUMER_SECRET
  * ACCESS_TOKEN
  * ACCESS_SECRET
 * Google URL shortner environment variable
  * GOOGLE_API_KEY
* Testing: RSpec Suite
* Service: This site does not provide any services