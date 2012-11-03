require 'test/unit'

class TicTacToePlayer
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
		@who_moves_next = 1	
			
		@owned_by_x     = []
		@owned_by_zero  = []
 	end
  
	def turn(input)
		if @who_moves_next == 1 
			@owned_by_x << (BOARD - @owned_by_x - @owned_by_zero).sample
    	else
			@owned_by_zero << (BOARD - @owned_by_x - @owned_by_zero).sample
		end
		@who_moves_next = 0
		return {:owned_by_x => @owned_by_x, :owned_by_zero => @owned_by_zero}	
	end
end

class TestPlayer < Test::Unit::TestCase
  def test_truthiness
    functionality_implemented = true
    assert( functionality_implemented, failure_message = "Functionality not implemented" )
  end

def test_responds_to_turn
    tttp = TicTacToePlayer.new
    assert_respond_to( tttp, :turn, failure_message = "An instance of TicTacToePlayer does not respond to turn" )
  end
  
  	def test_does_not_raise_exception_to_argument
	  	assert_nothing_raised  do
	  		tttp = TicTacToePlayer.new
	  		tttp.turn :asd
	  	end
	end

	def test_does_not_raise_exception_to_hash
	  	assert_nothing_raised  do
	  		tttp = TicTacToePlayer.new
	  		tttp.turn ({:asd => [4,3,5], :sad => [1,2,3]})
	  	end
	end	
	
	def test_does_not_raise_exception_to_input
	  	assert_nothing_raised  do
	  		tttp = TicTacToePlayer.new
	  		tttp.turn ({:owned_by_x => nil, :owned_by_zero => nil})
	  	end
	end	
	
	def assert_not_nil(exp, msg=nil)
  		msg = message(msg) { "<#{mu_pp(exp)}> expected to not be nil" }
  		assert(!exp.nil?, msg)
	end
	
	def test_turn_not_nil
		tttp = TicTacToePlayer.new
	  	
		assert_not_nil(tttp.turn "Saaad")
	end
	
	def test_turn_returns_keys
		tttp = TicTacToePlayer.new
	  	
		assert_equal(tttp.turn({:owned_by_x => [], :owned_by_zero => []}).keys, [:owned_by_x, :owned_by_zero])
	end		

end


