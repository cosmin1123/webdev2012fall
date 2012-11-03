require 'test/unit'

class TicTacToePlayer
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
end
