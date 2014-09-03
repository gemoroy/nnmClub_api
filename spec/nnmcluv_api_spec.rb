require "nnmClub_api"

describe "NnmClub" do
  describe "Search" do
    before {
      @query = "ruby on rails"
      @search = NnmClub::Search.new @query
      @url = NnmClub::URL
    }
    it "should return correct url without category" do
      expect(@search.url).to eq(@url+"nm=#{URI.escape(@query)}")
    end

    it "should return correct url with category" do
      @search = NnmClub::Search.new(@query,17)
      expect(@search.url).to eq(@url+"nm=#{URI.escape(@query)}"+"&c=17")
    end
  end

  describe "#torrents" do
    before {
      @query = "ruby on rails"
      @search = NnmClub::Search.new @query
    }

    it "should return array" do
      expect(@search.torrents.class).to eq([].class)
    end

    it "should retur array of 3 elements" do
      expect(@search.torrents.length).to eq(3)
    end
  end

  describe "Torrent" do
    before {
      @torrent_id = "97600"
      @torrent    = NnmClub::Torrent.find @torrent_id
    }
    it "should return @description" do
      expect(@torrent.class).to eq({}.class)
    end
  end

end
