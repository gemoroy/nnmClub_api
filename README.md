# NnmClubApi

### Is usefull gem if you need to parse nnm-club.me tracker.

## Installation

Add this line to your application's Gemfile:

    gem 'nnmClub_api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nnmClub_api

## Usage

	require 'nnmClub_api'

	client = NnmclubApi.new('user','pass')
	client.search(:title => "Noize MC")

	puts client.result

## Contributing

1. Fork it ( https://github.com/gemoroy/nnmClub_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
