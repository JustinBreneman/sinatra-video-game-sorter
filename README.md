# sinatra-video-game-sorter

Welcome, this codebase was assembled to provide an online video game library and sorter. Users can log on to add, edit, or remove games from their account. There is also functionality for adding new platforms for games.

## Installation

Fork and clone this [repo](https://github.com/JustinBreneman/sinatra-video-game-sorter)

Then cd into the directory where the repo is located
and  execute:

    $ bundle install

After bundler is finished installing, execute:

    $ rake db:migrate

This will create the database for you.

To seed the database with some test data, execute:

    $ rake db:seed

For production it is recommended that lines 22 through 42 in the seeds.rb file are commented out.