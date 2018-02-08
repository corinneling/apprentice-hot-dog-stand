require './lib/models/condiments'

class TestCondiments < MiniTest::Test
  def setup
    @condiments = Condiments.new
    @options = ["none", "ketchup", "mustard", "relish", "horseradish", "onions", "sauerkraut"]
  end

  def test_respond_to_select
    assert_respond_to @condiments, :select
  end

  # receives argument
  
  def test_respond_to_prompt
    assert_respond_to @condiments, :prompt
  end

  # def test_prompts_condiment_options
  # end

  # def test_displays_condiment_options
  # end

  # def test_selects_correct_condiment_option
  # end
end