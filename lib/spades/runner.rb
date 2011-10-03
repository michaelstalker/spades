require_relative 'dealer'
require_relative 'player'
require_relative 'score_keeper'
require 'benchmark'

module Spades
  class Runner
    
    def initialize(argv)
      
      @num_tests = argv.first.to_i
    end
    
    def run
      dealer = Spades::Dealer.new
      score_keeper = Spades::ScoreKeeper.new
      players = round_up_players
      rounds_played = 0
      
      players.each { |player| player.add_observer(score_keeper) }
      
      while rounds_played < @num_tests
        play_hand(dealer, players)
        dealer.rebuild_deck
        rounds_played += 1
      end      

      print_win_data(score_keeper)
      
    end
    
    private
    
    def round_up_players
      four_players = []
      4.times { four_players << Spades::Player.new }
      four_players
    end
    
    def play_hand(dealer, players)
      dealer.shuffle

      players.each do |player|
        dealer.deal(player)
        player.play_card
        player.clear_hand
      end
    end
    
    def print_win_data(score_keeper)
      puts "Percentages of Wins\n---------------"
      puts "2 of Clubs: #{score_keeper.percent_won(:'2_clubs')}"
      puts "3 of Clubs: #{score_keeper.percent_won(:'3_clubs')}"
      puts "4 of Clubs: #{score_keeper.percent_won(:'4_clubs')}"
      puts "5 of Clubs: #{score_keeper.percent_won(:'5_clubs')}"
      puts "6 of Clubs: #{score_keeper.percent_won(:'6_clubs')}"
      puts "7 of Clubs: #{score_keeper.percent_won(:'7_clubs')}"
      puts "8 of Clubs: #{score_keeper.percent_won(:'8_clubs')}"
      puts "9 of Clubs: #{score_keeper.percent_won(:'9_clubs')}"
      puts "10 of Clubs: #{score_keeper.percent_won(:'10_clubs')}"
      puts "Jack of Clubs: #{score_keeper.percent_won(:jack_clubs)}"
      puts "Queen of Clubs: #{score_keeper.percent_won(:queen_clubs)}"
      puts "King of Clubs: #{score_keeper.percent_won(:king_clubs)}"
      puts "Ace of Clubs: #{score_keeper.percent_won(:ace_clubs)}"
      puts "Spades: #{score_keeper.spades_percent_won}"
    end
    
  end
end