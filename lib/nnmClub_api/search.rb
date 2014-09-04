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
    attr_reader :torrents
    def initialize(query, agent = Mechanize.new)
      form = agent.get(NnmClub::URL).forms.last
      form.field("nm").value = query
      form.checkbox("sd").check
      form.checkbox("a").check
      torrents = form.submit.search(".prow1",".prow2").collect { |row|
        torrent = { 
          :title      => row.css(".topictitle").empty? ? (nil and status=true)  : row.css(".topictitle").text.strip,
          :size       => row.at("td[6]/u").nil? ? nil : row.at("td[6]/u").text.to_i,
          :seeders    => row.css(".seedmed").empty? ? nil : row.css(".seedmed").text.to_i,
          :torrent_id => status ? nil : row.css(".topictitle").first[:href].split("=").last
        }
        torrent unless torrent.any_nil?
      }
      @torrents = torrents

    end
  end
end