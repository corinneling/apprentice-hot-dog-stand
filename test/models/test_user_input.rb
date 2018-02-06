require 'minitest/autorun'
require_relative './../models/user_input.rb'
require_relative './../helpers.rb'

class HotDogTest < Minitest::Test
  def setup
    @options = ["meat", "buns", "condiments"]
  end

  # get_index method tests
  def test_get_index_with_number
    def Helpers.get_action; 1 end
    assert_equal(UserInput.get_index(@options), 1)
  end
  # void? method tests
  def test_void_with_0_should_return_true
    assert_equal(UserInput.void?(0), true)
  end

  def test_void_with_nil_should_return_true
    assert_equal(UserInput.void?(nil), true)
  end

  def test_void_with_1_should_return_true
    assert_equal(UserInput.void?(1), false)
  end

  # valid_index? tests
  def test_valid_index
    assert_equal(UserInput.valid_index?(1, 0, 3), true)
  end

  def test_valid_index_again
    assert_equal(UserInput.valid_index?(4, 0, 3), false)
  end
end
