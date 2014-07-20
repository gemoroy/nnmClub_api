require 'nnmClub_api'

describe "NnmclubApi " do
  before { @tracker = NnmclubApi.new('login', 'pass') }
  subject { @tracker }

  describe "#search" do
    describe "with valid params" do
      it "returns link with term" do
        expect( @tracker.search(title: "Noize MC") ).to eq('http://nnm-club.me/forum/tracker.php?nm=Noize%20MC')
      end
    end
  end
end
