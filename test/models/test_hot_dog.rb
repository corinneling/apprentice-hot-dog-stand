require './lib/models/hot_dog'

class HotDogTest < Minitest::Test
  def setup
    @hot_dog = HotDog.new
    @meat = "beef"
    @bun = "whole wheat"
    @condiment_1 = "ketchup"
    @condiment_2 = "mustard"
  end

  # HotDog#meat
  def test_meat_returns_a_string
    assert_kind_of(String, @hot_dog.meat = @meat)
  end

  def test_meat_returns_selected_meat
    assert_equal(@hot_dog.meat = @meat, "beef")
  end
  
  # HotDog#bun
  def test_bun_returns_a_string
    assert_kind_of(String, @hot_dog.bun = @bun)
  end

  def test_bun_returns_selected_bun
    assert_equal(@hot_dog.bun = @bun, "whole wheat")
  end

  # HotDog#condiments
  def test_condiments_returns_1_selected_condiment
    assert_equal(@hot_dog.condiments << "ketchup", ["ketchup"])
  end

  def test_condiments_returns_2_selected_condiments
    assert_equal(@hot_dog.condiments << "ketchup", ["ketchup"])
    assert_equal(@hot_dog.condiments << "mustard", ["ketchup", "mustard"])
  end
end
