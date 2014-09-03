require "uri"
require "open-uri"
require "nokogiri"

class Hash
  def any_nil?
    @result = false
    self.keys.each { |key|
      @result = self[key].nil? ? true : false
      break if @result
    }   
    @result
  end 
end


module NnmClub

  class Search
    attr_reader :torrents, :url
    def initialize(query, category = nil)
      torrents = []
      query = URI.escape(query)
      @url = NnmClub::URL+"nm=#{query}"+(!category.nil? ? "&c=#{category}" : "")

      document = Nokogiri::HTML(open(@url))
      document.css("table.forumline.tablesorter").css(".prow1",".prow2").each { |row|

        size          = row.at("td[6]/u").nil? ? nil : row.at("td[6]/u").text.to_i
        title         = row.css(".topictitle").empty? ? nil : row.css(".topictitle").text.strip
        seeders       = row.css(".seedmed").empty? ? nil : row.css(".seedmed").text.to_i
        leechers      = row.css(".leechmed").empty? ? nil : row.css(".leechmed").text.to_i
        torrent_id    = row.css(".topictitle").empty? ? nil : row.css(".topictitle").first[:href].split("=").last
    
        torrent = { :title      => title,
                    :size       => size,
                    :seeders    => seeders,
                    :leechers   => leechers,
                    :torrent_id => torrent_id,
                    :tracker    => NnmClub::ID
        }
        torrents.push(torrent) unless torrent.any_nil?
      }
      @torrents = torrents
    end
  end
end