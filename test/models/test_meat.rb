require './lib/models/meat'

class TestMeat < MiniTest::Test
  def setup
    @meat = Meat.new
    @options = ['polish', 'beef', 'jalepano', 'tofu', 'mystery meat']
  end

  def test_respond_to_select
    assert_respond_to @meat, :select
  end
  
  # receives argument

  def test_respond_to_prompt
    assert_respond_to @meat, :prompt
  end

  # def test_prompts_meat_options
  # end

  # def test_displays_meat_options
  # end

  # def test_selects_correct_meat_option
  # end
end