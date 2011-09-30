require_relative 'card'

module Spades
  class ScoreKeeper
    
    attr_reader :wins
    
    def initialize
      @queue = []
      @wins = { :'2_clubs' => 0, :'3_clubs' => 0, :'4_clubs' => 0, :'5_clubs' => 0,
                :'6_clubs' => 0, :'7_clubs' => 0, :'8_clubs' => 0, :'9_clubs' => 0,
                :'10_clubs' => 0, :jack_clubs => 0, :queen_clubs => 0, :king_clubs => 0,
                :ace_clubs => 0,
                
                :'2_spades' => 0, :'3_spades' => 0, :'4_spades' => 0, :'5_spades' => 0,
                :'6_spades' => 0, :'7_spades' => 0, :'8_spades' => 0, :'9_spades' => 0,
                :'10_spades' => 0, :jack_spades => 0, :queen_spades => 0,
                :king_spades => 0, :ace_spades => 0
      }
    end
    
    def add_to_queue(card)
      @queue << card
      increment_win_count(winner) if queue_count == 4
    end
    
    def queue_count
      @queue.count
    end
    
    def win_count(card)
      @wins[card.name.to_sym]
    end
    
    def update(card)
      add_to_queue(card)
    end
    
    private
    
    def winner
      @queue.sort! { |card_1, card_2| card_2 <=> card_1 }
      @queue.first
    end
    
    def increment_win_count(card)
      @wins[card.name.to_sym] += 1
    end
  end
end