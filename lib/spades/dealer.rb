require_relative 'deck'
require 'Forwardable'

module Spades
  class Dealer
    extend Forwardable
    
    def_delegator :@deck, :shuffle
    attr_reader :deck
    
    def initialize
      @deck = Spades::Deck.new
    end
    
    def deal(player)
      quarter_deck = @deck.next_13_cards
      player.take_cards(quarter_deck)
    end
    
    def rebuild_deck
      @deck = Spades::Deck.new
    end
  end
end