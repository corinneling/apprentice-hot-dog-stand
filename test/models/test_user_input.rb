require 'minitest/autorun'
require './lib/models/user_input'
require 'stringio'

class TestUserInput < Minitest::Test
  def setup
    @stringio = StringIO.new
    $stdin = @stringio
  end
  
  def test_0_is_valid_menu_input
    @stringio.puts "0"
    @stringio.rewind
    
    result = UserInput.new(0, 1)
    assert_equal 0, result.value
  end
  
  def test_1_is_valid_menu_input
    @stringio.puts "1"
    @stringio.rewind

    result = UserInput.new(0, 1)
    assert_equal 1, result.value
  end

  # def test_2_is_invalid_menu_input
  #   @stringio.puts "2"
  #   @stringio.rewind

  #   result = UserInput.new(0, 1)
  #   refute result.valid?
  # end

  # def test_nil_is_invalid_menu_input
  #   @stringio.puts ""
  #   @stringio.rewind

  #   result = UserInput.new(0, 1)
  #   refute result.valid?
  # end
end