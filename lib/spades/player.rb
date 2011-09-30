require 'observer'

module Spades
  class Player
    include Observable
    attr_reader :hand
    
    def initialize
      @hand = []
    end
    
    def take_cards(cards)
      @hand = cards
    end
    
    def sort_hand
      @hand.sort! { |card_1, card_2| card_2.compare_play_priority(card_1) }
    end
    
    def play_card
      card = @hand.delete_at(0)
      changed
      notify_observers(card)
      card
    end
    
    def return_cards
      @hand.clear
    end
  end
end