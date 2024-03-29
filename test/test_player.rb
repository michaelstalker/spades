require 'test/unit'
require 'shoulda'
require 'redgreen'
require_relative '../lib/spades/player'
require_relative '../lib/spades/card'

class TestPlayer < Test::Unit::TestCase
  should 'have an empty hand when player gets initialized' do
    player = Spades::Player.new
    assert_equal(player.hand, [])
  end
  
  context 'playing a hand' do
    setup do
      @ace_hearts = Spades::Card.new(:ace_hearts)
      @three_clubs = Spades::Card.new(:'3_clubs')
      @nine_diamonds = Spades::Card.new(:'9_diamonds')
      @king_spades = Spades::Card.new(:king_spades)
      @cards = [@ace_hearts, @three_clubs, @king_spades, @nine_diamonds]
      @player = Spades::Player.new
    end
      
    should 'take cards from dealer' do
      @player.take_cards(@cards)
      assert @player.hand
    end
      
    should 'play highest priority card' do
      @player.take_cards(@cards)
      card = @player.play_card
      assert_equal(card, @three_clubs)
    end
    
    should 'have one less card after playing a card' do
      @player.take_cards(@cards)
      @player.play_card
      assert_equal(@player.hand.count, 3)
    end
    
    should 'not have any cards in hand after returning cards' do
      @player.take_cards(@cards)
      @player.clear_hand
      assert_equal(@player.hand.count, 0)
    end
  end
end