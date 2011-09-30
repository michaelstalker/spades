require 'test/unit'
require 'shoulda'
require 'redgreen'
require_relative '../lib/spades/deck'

CARDS = ['2_spades', '3_spades', '4_spades', '5_spades', '6_spades', '7_spades', '8_spades',
         '9_spades', '10_spades', 'jack_spades', 'queen_spades', 'king_spades', 'ace_spades',
         '2_clubs', '3_clubs', '4_clubs', '5_clubs', '6_clubs', '7_clubs', '8_clubs', '9_clubs',
         '10_clubs', 'jack_clubs', 'queen_clubs', 'king_clubs', 'ace_clubs', '2_hearts', '3_hearts',
         '4_hearts', '5_hearts', '6_hearts', '7_hearts', '8_hearts', '9_hearts', '10_hearts',
         'jack_hearts', 'queen_hearts', 'king_hearts', 'ace_hearts', '2_diamonds', '3_diamonds',
         '4_diamonds', '5_diamonds', '6_diamonds', '7_diamonds', '8_diamonds', '9_diamonds',
         '10_diamonds', 'jack_diamonds', 'queen_diamonds', 'king_diamonds', 'ace_diamonds']

class TestDeck < Test::Unit::TestCase
  context 'initialize deck' do
    setup do
      @deck = Spades::Deck.new
    end
    
    should 'have 52 cards in deck' do
      assert_equal(@deck.cards.count, 52)
    end
  end
  
  context 'deck actions' do
    should 'shuffle cards' do
      deck = Spades::Deck.new
      successful_shuffle = false
      
      old_order = Marshal.load(Marshal.dump(deck.cards))
      deck.shuffle
      new_order = deck.cards
      
      (0..51).each { |n| successful_shuffle = true if old_order[n] != new_order[n] }
      
      assert successful_shuffle
    end
  end
end