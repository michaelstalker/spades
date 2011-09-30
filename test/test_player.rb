require 'test/unit'
require 'shoulda'
require 'redgreen'
require_relative '../lib/spades/player'
require_relative '../lib/spades/card'

class TestPlayer < Test::Unit::TestCase
  context 'playing a hand' do
    
    setup do
      @ace_hearts = Spades::Card.new('ace_hearts')
      @three_clubs = Spades::Card.new('3_clubs')
      @nine_diamonds = Spades::Card.new('9_diamonds')
      @king_spades = Spades::Card.new('king_spades')
      @cards = [@ace_hearts, @three_clubs, @king_spades, @nine_diamonds]
      @player = Spades::Player.new
    end
      
    should 'take cards from dealer' do
      @player.take_cards(@cards)
      assert @player.hand
    end
  
    should 'sort hand' do
      @player.take_cards(@cards)
      @player.sort_hand
      assert_equal(@player.hand, [@three_clubs, @nine_diamonds, @ace_hearts, @king_spades])
    end
    
    should 'play highest priority card' do
      @player.take_cards(@cards)
      @player.sort_hand
      card = @player.play_card
      assert_equal(card, @three_clubs)
    end
    
    should 'only one less card after playing a card' do
      @player.take_cards(@cards)
      @player.play_card
      assert_equal(@player.hand.count, 3)
    end
    
    should 'not have any cards in hand after returning cards' do
      @player.take_cards(@cards)
      @player.return_cards
      assert_equal(@player.hand.count, 0)
    end
  end
end