require "nnmClub_api/version"
require "rubygems"
require "mechanize"
require "json"

class NnmclubApi
  attr_accessor :agent, :result

  LOGIN_PAGE  = 'http://nnm-club.me/forum/login.php'
  SEARCH_PAGE = 'http://nnm-club.me/forum/tracker.php'

  ORDER_OPTIONS = { date: 1, name: 2, downloads: 4, shows: 6, seeders: 10,
                    leechers: 11, size: 7, last_post: 8, speed_up: 12,
                    speed_down: 13, message_count: 5, last_seed: 9 }
  SORT_OPTIONS = {asc: 1, desc: 2}

  def initialize(username, password)
    @agent = Mechanize.new
    @agent.user_agent_alias = "Mac Safari"
  end

  def result
    @result.to_json
  end

  #@param option [Hash] the format type, `:title`
  #@return [Hash] the options keys with search result
  def search(options = {})
    @result = []
    query = prepare_query_string options
    @agent.get query
    parse_search
  end

  private
    def prepare_query_string(options)
      #?q=lorem+ipsum&w=title
      SEARCH_PAGE+"?nm="+options[:title].gsub(/\s/,'%20')
    end

    def parse_search
    @agent.page.search("//table[@class='forumline tablesorter']/tbody/tr").map do |row|
      size        = row.at("td[6]/u").text.to_i
      title       = row.css(".topictitle").text.strip
      seeders     = row.css('.seedmed').text.to_i
      leechers    = row.css('.leechmed').text.to_i
      torrent_id  = row.css('.topictitle').at('a')

      if !title.nil? && !title.empty? && !torrent_id.nil?
        @result.push ({ title: title, torrent_id: "http://nnm-club.me/forum/#{torrent_id.values.last}", 
          seeders: seeders, leechers: leechers, size: size })
      end
    end
  end
end
