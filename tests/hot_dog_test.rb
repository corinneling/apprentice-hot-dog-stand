require 'minitest/autorun'
require_relative '../models/hot_dog'

class HotDogTest < Minitest::Test
  def setup
    @hot_dog = HotDog.new
    @index_1 = 1
    @index_2 = 2
  end
  
  # choose_hot_dog tests
  
  # choose_bun tests
  def test_choose_bun_returns_a_string
    assert_kind_of(String, @hot_dog.choose_bun(@index_1))
  end
  
  def test_choose_bun_returns_selected_bun
    assert_equal(@hot_dog.choose_bun(@index_1), "whole wheat")
  end
  
  # choose_condiment test
  def test_returns_1_selected_condiment
    @hot_dog.choose_condiment(@index_1)
    assert_equal(@hot_dog.condiments, ["ketchup"])
  end
  
  def test_returns_2_selected_condiments
    # adds "ketchup" to @condiments
    @hot_dog.choose_condiment(@index_1)
    # adds "relish" to @condiments
    @hot_dog.choose_condiment(@index_2)

    assert_equal(@hot_dog.condiments, ["ketchup", "mustard"])
  end
end