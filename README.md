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
  
### Example:Search

    NnmClub::Search("noize mc").torrents

returns an Array of Hashes

    { 
      :title    => the title of the distribution,
      :size       => size,
      :seeders    => seeders,
      :torrent_id => torrent_id,
    }
    
### Example:Torrent

    NnmClub::Torrent.find "97600"
    
returns an Hash

    {   
        :content    => "HTML",
        :image      => "URL",
        :magnet     => magnet-link or none
    }
    
### Example:NnmClub_api

    api = NnmClub:NnmClub_api.new
    api.search("noize mc")
    #=> Array of Hashes { :title => ..., }
    api.find("97600")
    #=> Hash { :content => ..., }


## Contributing

1. Fork it ( https://github.com/gemoroy/nnmClub_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
