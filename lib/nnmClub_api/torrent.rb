module NnmClub
  class Torrent
    def self.find(torrent_id, agent = Mechanize.new)
      torrent_url   = NnmClub::TorrentURL+torrent_id
      document      = agent.get(torrent_url)
      content_xpath = "/html/body/div[@class='wrap']/table//tr[2]/td/table//tr/td/table[@class='forumline']//tr[@class='row1']/td[@class='row1'][2]/table//tr[3]/td"
      link_xpath    = "/html/body/div[2]/table//tr[2]/td/table//tr/td/table[5]//tr[2]/td[2]/table//tr[4]/td/table[2]//tr[2]/td[3]/a"
      content       = document.search(content_xpath)
      content.search(".//img",".//a").remove
      return {
        :content  => content.to_html(encoding: "UTF-8"),
        :magnet   => document.search(link_xpath).empty? ? torrent_url : document.search(link_xpath).first[:href],
        :image    => document.search('var.postImg').first[:title]
      }
    end
  end
end

