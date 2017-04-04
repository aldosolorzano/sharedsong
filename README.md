# README

Shared Song is a web application that allows users to listen to music and share their favourite songs with others utilizing the Spotify API. Using this Shared Song, users are also able to easily track both what has been shared with them, and what they've shared with others.
To improve the search queries, the seed file will populate a table with songs and using elastic search the results will be more accurate, and also show suggestion for the songs.

System dependencies
  - Ruby 2.3.1
  - postgreSQL 9.5.6
  - Rails 5.0.2
  - Elasticsearch 5.2.2

Configuration

  - git clone https://github.com/aldosolorzano/sharedsong.git 
  - run ->  bundle
  
Database creation
  - rails/rake db:create db:migrate db:seed

How to run the test suite
  - run rails s  
  - go to http://localhost:3000
  
Happy Coding :)

Feedback is welcome 

