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

## Usage

To seed the database with some test data, execute:

    $ rake db:seed

For production it is recommended that lines 22 through 42 in the seeds.rb file are commented out before running the previous command.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/JustinBreneman/sinatra-video-game-sorter. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/JustinBreneman/sinatra-video-game-sorter/blob/main/CODE_OF_CONDUCT.md).

## License

This codebase is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting with the Sinatra Video Game Sorter project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/JustinBreneman/sinatra-video-game-sorter/blob/main/CODE_OF_CONDUCT.md).