require 'rails_helper'

RSpec.describe Nbaplayer, type: :model do
  it "has 0 players at the begin" do
    expect(Nbaplayer.count).to eq(0)
  end

  it "should have a cost for every player" do
    expect(Nbaplayer.all).to have(:cost)
  end

end
