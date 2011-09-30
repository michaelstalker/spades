module Spades
  class Player
    attr_reader :hand
    
    def initialize
      @hand = []
    end
    
    def take_cards(cards)
      @hand = cards
    end
    
    def sort_hand
      @hand.sort! { |card_a, card_b| card_b <=> card_a }
    end
    
    def play_card
      @hand.delete_at(0)
    end
    
    def return_cards
      @hand.clear
    end
  end
end