require "uri"
require "open-uri"
require "nokogiri"

module NnmClub
  class Torrent
    def self.find(torrent_id)
      document = Nokogiri::HTML(open(NnmClub::TorrentURL+torrent_id))
      postbody = document.css('.postbody').first
      info = {:content  => postbody.to_html( encoding: "UTF-8" ),
              :image    => postbody.css('var.postImg').empty? ? "nil" : postbody.css('var.postImg').first['title']
      }
      return info
    end
  end
end