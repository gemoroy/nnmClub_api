require "nnmClub_api"
require "mechanize"

describe "NnmClub" do
  describe "#torrents" do
    before {
      @query = "ruby on rails"
      agent = NnmClub::NnmClub_api.new.agent
      @search = NnmClub::Search.new(@query,agent)
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
      @torrent_id = "728159"
      agent = NnmClub::NnmClub_api.new.agent
      @torrent    = NnmClub::Torrent.find(@torrent_id,agent)
    }
    it "should return @description" do
      expect(@torrent.class).to eq({}.class)
    end
    it "should return image" do
      expect(@torrent[:image].empty?).to eq(false)
    end
    it "should return content" do
      expect(@torrent[:content].empty?).to eq(false)
    end
    it "should return link" do
      expect(@torrent[:magnet].empty?).to eq(false)
    end
  end
end
