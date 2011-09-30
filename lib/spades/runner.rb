require_relative 'dealer'
require_relative 'player'

module Spades
  class Runner
    def run
      dealer = Spades::Dealer.new
      players = round_up_players
      dealer.shuffle
      players.each do |player|
        dealer.deal(player)
        player.sort_hand
        player.play_card
      end
    end
    
    private
    
    def round_up_players
      four_players = []
      4.times { four_players << Spades::Player.new }
      four_players
    end
    
  end
end