module Spades
  class Card
    attr_reader :name, :value
    
    VALUES = { '2_diamonds' => 1, '3_diamonds' => 2, '4_diamonds' => 3, '5_diamonds' => 4,
               '6_diamonds' => 5, '7_diamonds' => 6, '8_diamonds' => 7, '9_diamonds' => 8,
               '10_diamonds' => 9, 'jack_diamonds' => 10, 'queen_diamonds' => 11,
               'king_diamonds' => 12, 'ace_diamonds' => 13,
               
               '2_hearts' => 14, '3_hearts' => 15, '4_hearts' => 16, '5_hearts' => 17,
               '6_hearts' => 18, '7_hearts' => 19, '8_hearts' => 20, '9_hearts' => 21,
               '10_hearts' => 22, 'jack_hearts' => 23, 'queen_hearts' => 24,
               'king_hearts' => 25, 'ace_hearts' => 26,
               
               '2_clubs' => 27, '3_clubs' => 28, '4_clubs' => 29, '5_clubs' => 30,
               '6_clubs' => 31, '7_clubs' => 32, '8_clubs' => 33, '9_clubs' => 34,
               '10_clubs' => 35, 'jack_clubs' => 36, 'queen_clubs' => 37, 'king_clubs' => 38,
               'ace_clubs' => 39,
               
               '2_spades' => 40, '3_spades' => 41, '4_spades' => 42, '5_spades' => 43,
               '6_spades' => 44, '7_spades' => 45, '8_spades' => 46, '9_spades' => 47,
               '10_spades' => 48, 'jack_spades' => 49, 'queen_spades' => 50,
               'king_spades' => 51, 'ace_spades' => 52 }
    
    
    def initialize(name)
      @name = name
      @value = VALUES[name]
    end
    
    def <(card)
      self.value < card.value
    end
    
    def >(card)
      self.value > card.value
    end
  end
end