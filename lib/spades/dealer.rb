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
  end
end