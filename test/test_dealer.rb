require 'test/unit'
require 'shoulda'
require 'redgreen'
require_relative '../lib/spades/dealer'

class TestDealer < Test::Unit::TestCase
  context 'working with deck' do
  
    setup do
      @dealer = Spades::Dealer.new
    end
  
    should 'have deck of cards' do
      assert @dealer.deck
    end
  
    should 'shuffle deck' do
      successful_shuffle = false
    
      old_order = Marshal.load(Marshal.dump(@dealer.deck.cards))
      @dealer.shuffle
      new_order = @dealer.deck.cards
    
      (0..51).each { |n| successful_shuffle = true if old_order[n] != new_order[n] }
    
      assert successful_shuffle
    end
  end
end