# Sinatra demo app

## RVM setup

The project's .rvmrc expects Ruby 1.9.2 with a gemset _sinatra-demo_

    rvm install 1.9.2
    rvm use 1.9.2
    rvm gemset create sinatra-demo

## Installation

    cd sinatra-demo
    gem install bundler
    bundle
    
## Running the server

    shotgun
    
## Running the tests

    cucumber