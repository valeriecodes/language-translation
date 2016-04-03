[![Build Status](https://travis-ci.org/systers/language-translation.svg?branch=develop)](https://travis-ci.org/systers/language-translation)

[![Join the chat at https://gitter.im/systers/language-translation](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/systers/language-translation?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

## GSoc Photo Language Translation Project 2015
1. Gsoc timeline :
2. Developer's Systers profile page :
3. Link to the deployed application :

## Features and Specifications
[link to wiki article](https://github.com/systers/language-translation/wiki/Features-and-Specifications)

## Application Structure
[link to wiki article](https://github.com/systers/language-translation/wiki/Application-Structure)

## Framework and specifications

1. Rails 4.2.1
2. Ruby 2.2.0p0
3. PostgreSQL (development, test, deployment)

## Instructions on running the application

1. Clone the application repo: `git clone https://github.com/systers/language-translation` (Substituting the url with your fork if you've made one)
2. Enter the application's root directory: `cd language-translation`
3. Install bundler if you don't have it already: `gem install bundler`
4. Install GraphViz for full functionality of `ruby-graphviz`: `brew install graphviz`
5. Install npm to use bower: `brew install npm`
6. Install bower: `npm install -g bower`
7. Set up your database: `rake db:create && rake db:migrate && rake db:seed`
8. Install bower components: `bower install`
9. Start server: `rails s`
9. Enter `localhost:3000` on a web browser
