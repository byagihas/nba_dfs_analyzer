require 'models/nbaplayer'

describe 'Nbaplayer' do

  describe 'attributes' do
    it "allows reading and writing for :cost" do
      nbaplayer = Nbaplayer.new
      nbaplayer.cost = 5000
      expect(nbaplayer.cost).to_eq(5000)
    end
  end

  describe '.list' do
    it "returns a list of nba players" do
      #expectations
      #expect().to()
      #expect().not_to()
    end
  end
end
