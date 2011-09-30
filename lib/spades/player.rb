module Spades
  class Player
    attr_reader :hand
    
    def take_cards(cards)
      @hand = cards
    end
    
    def sort_hand
      @hand.sort! { |card_a, card_b| card_b <=> card_a }
    end
  end
end