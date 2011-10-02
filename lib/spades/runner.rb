require_relative 'dealer'
require_relative 'player'
require_relative 'score_keeper'
require 'benchmark'

module Spades
  class Runner
    
    def initialize(argv)
      # Add error handlding here
      @num_tests = argv.first.to_i
    end
    
    def run
      dealer = Spades::Dealer.new
      score_keeper = Spades::ScoreKeeper.new
      players = round_up_players
      current_test_count = 0
      
      players.each { |player| player.add_observer(score_keeper) }
      
      puts Benchmark.measure {
      while current_test_count < @num_tests
        dealer.shuffle

        players.each do |player|
          dealer.deal(player)
          player.play_card
          player.hand.clear
        end
        
        dealer.rebuild_deck
        
        # have dealer pick up the cards and reshuffle the deck
        current_test_count += 1
      end      
      }  
      #p score_keeper.wins
      # Tally up the wins (combine wins for spades)
      # Calculate probabilities
    end
    
    private
    
    def round_up_players
      four_players = []
      4.times { four_players << Spades::Player.new }
      four_players
    end
    
  end
end