require 'test/unit'
require 'shoulda'
require 'redgreen'
require_relative '../lib/spades/score_keeper'
require_relative '../lib/spades/player'

class TestScoreKeeper < Test::Unit::TestCase
  context 'judging which card won the trick' do
    setup do
      @score_keeper = Spades::ScoreKeeper.new
      @two_clubs = Spades::Card.new(:'2_clubs')
      @seven_clubs = Spades::Card.new(:'7_clubs')
      @jack_clubs = Spades::Card.new(:jack_clubs)
      @three_diamonds = Spades::Card.new(:'3_diamonds')
    end
    
    should 'decide which card wins the trick' do
      cards = [@two_clubs, @seven_clubs, @jack_clubs, @three_diamonds]
      cards.each { |card| @score_keeper.add_to_queue(card) }
      assert_equal(@score_keeper.win_count(@jack_clubs), 1)
    end
    
    should 'add a card to the queue when a player plays a card' do
      player = Spades::Player.new
      player.add_observer(@score_keeper)
      player.take_cards([@two_clubs, @seven_clubs, @jack_clubs, @three_diamonds])
      player.play_card
      assert_equal(@score_keeper.queue_count, 1)
    end
    
    should 'clear queue when number in queue reaches 4' do
      player_1 = Spades::Player.new
      player_1.take_cards([@two_clubs, @seven_clubs, @jack_clubs, @three_diamonds])
      
      player_2 = Spades::Player.new
      player_2.take_cards([@two_clubs, @seven_clubs, @jack_clubs, @three_diamonds])
      
      player_3 = Spades::Player.new
      player_3.take_cards([@two_clubs, @seven_clubs, @jack_clubs, @three_diamonds])
      
      player_4 = Spades::Player.new
      player_4.take_cards([@two_clubs, @seven_clubs, @jack_clubs, @three_diamonds])
      
      players = [player_1, player_2, player_3, player_4]
      players.each do |player|
        player.add_observer(@score_keeper)
        player.play_card
      end

      assert_equal(@score_keeper.queue_count, 0)
    end
  end
end