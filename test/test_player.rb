require 'test/unit'
require 'shoulda'
require 'redgreen'
require_relative '../lib/spades/player'

class TestPlayer < Test::Unit::TestCase
  should 'take cards from dealer' do
    player = Spades::Player.new
    cards = []
    player.take_cards(cards)
    assert player.hand
  end
  
end