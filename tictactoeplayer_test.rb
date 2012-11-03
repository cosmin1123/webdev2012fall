require 'test/unit'

class TicTacToePlayer
	def turn(input)
	
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

end


