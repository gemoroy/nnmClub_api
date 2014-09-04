require "nnmClub_api"

describe "NnmClub" do
  describe "NmmClub_api" do
    before {
      @api    = NnmClub::NnmClub_api.new
      @query  = "ruby on rails"
      @id     = "97600"
    }
    it "should not be bad login" do
      expect(@api.nil?).to eq(false)
    end
    it "should return results Array" do
      expect(@api.search(@query).class).to eq([].class)
    end
    it "should return results Array" do
      expect(@api.find(@id).class).to eq({}.class)
    end
  end
end