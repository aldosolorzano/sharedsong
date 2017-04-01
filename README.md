# README

This is a web app that allow users to search for any song and share it with other users. 
Each user has a dashboard where they can find all the shares created or the ones tha other users have shared with them.
The app relies on the Spotify API to find songs and artist and also be able to reproduce a preview of the songs.
To improve the search queries the seed file will populate a table with songs and using elastic search the results will be more accurate, and also show suggestion for the songs.

System dependencies
  - Ruby 2.3.1
  - postgreSQL 9.5.6
  - Rails 5.0.2

Configuration

  git clone https://github.com/aldosolorzano/sharedsong.git 
  run ->  bundle
  
Database creation

  rails/rake db:create db:migrate db:seed

How to run the test suite

  - run rails s  
  - go to http://localhost:3000
  
Happy Coding :)

Feedback is welcome 

