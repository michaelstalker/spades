require 'test/unit'
require 'shoulda'
require 'redgreen'
require_relative '../lib/spades/card'

class TestCard < Test::Unit::TestCase
  context 'initializing cards' do
    should 'assign name when card is initialized' do
      card = Spades::Card.new('4_spades')
      assert_not_nil card.name
      assert_equal(card.name, '4_spades')
    end
    
    should 'assign card value when card is initialized' do
      card = Spades::Card.new('ace_spades')
      assert_equal(card.value, 52)
    end
  end
  
  context 'determining card value' do
    setup do
      @ace_spades = Spades::Card.new('ace_spades')
      @two_spades = Spades::Card.new('2_spades')
      @ten_diamonds = Spades::Card.new('10_diamonds')
      @seven_hearts = Spades::Card.new('7_hearts')
      @three_clubs = Spades::Card.new('3_clubs')
    end
    
    should 'indicate one card is greater than another in same suit' do
      assert(@ace_spades > @two_spades)
    end
    
    should 'indicate one card is less than another' do
      assert(@two_spades < @ace_spades)
    end
    
    should 'inidcate spade is greater than heart' do
      assert(@two_spades > @seven_hearts)
    end
    
    should 'inidcate spade is greater than diamond' do
      assert(@two_spades > @ten_diamonds)
    end
    
    should 'indicate spade is greater than club' do
      assert(@two_spades > @three_clubs)
    end
    
    should 'indicate diamond is less than heart' do
      assert(@ten_diamonds < @seven_hearts)
    end
    
    should 'indicate diamond is less than club' do
      assert(@ten_diamonds < @three_clubs)
    end
    
    should 'indicate diamond is less than spade' do
      assert(@ten_diamonds < @two_spades)
    end
  end
end