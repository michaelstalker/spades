module Spades
  class Player
    attr_reader :hand
    
    def take_cards(cards)
      @hand = cards
    end
  end
end