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
    
    def play_card
      card_index = choose_card_index
      card = @hand.delete_at(card_index)
      changed
      notify_observers(card)
      card
    end
    
    def return_cards
      @hand.clear
    end
    
    private
    
    def choose_card_index
      card_to_play = @hand.first
      card_to_play_index = 0
      @hand.each_index do |current_card_index|
        current_card = @hand[current_card_index]
        if current_card.play_priority > card_to_play.play_priority
          card_to_play = current_card
          card_to_play_index = current_card_index
        end
      end
      card_to_play_index
    end
  end
end