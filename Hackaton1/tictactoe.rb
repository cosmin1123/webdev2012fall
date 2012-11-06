class TicTacToe
  BOARD = [:a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3]
  WINNING_COMBINATIONS = [[:a1, :a2, :a3],
                          [:b1, :b2, :b3],
                          [:c1, :c2, :c3],
                          [:a1, :b1, :c1],
                          [:a2, :b2, :c2],
                          [:a3, :b3, :c3],
                          [:a1, :b2, :c3],
                          [:c1, :b2, :a3]]

  def initialize
    @owned_by_x     = []
    @owned_by_zero  = []
    @who_moves_next = 1
  end

  def play
    9.times do
      if @who_moves_next == 1
        @owned_by_x << (BOARD - @owned_by_x - @owned_by_zero).sample
      else
        @owned_by_zero << (BOARD - @owned_by_x - @owned_by_zero).sample
      end
      WINNING_COMBINATIONS.each do |wcomb|
        return "Game over, X won." if (wcomb - @owned_by_x).empty?
        return "Game over, 0 won." if (wcomb - @owned_by_zero).empty?
      end
      @who_moves_next = 1 - @who_moves_next
    end
    "Game over, nobody won."
  end
end
