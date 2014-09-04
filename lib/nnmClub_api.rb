require "mechanize"
require "nnmClub_api/version"
require "nnmClub_api/tracker"
require "nnmClub_api/search"
require "nnmClub_api/torrent"

class Mechanize
  def login
    self.post(
      NnmClub::LOGIN_PAGE,
      username: NnmClub::USERNAME,
      password: NnmClub::PASSWORD,
      login: ""
    )
  end
end

module NnmClub
  class NnmClub_api
    attr_reader :agent
    def initialize
      @agent = Mechanize.new
      @agent.get(NnmClub::LOGIN_PAGE)
      @agent.login
      true
    end

    def search query
      NnmClub::Search.new(query, @agent).torrents
    end

    def find id
      NnmClub::Torrent.find(id, @agent)
    end
  end
end