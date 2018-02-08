require './lib/models/bun'

class TestBun < MiniTest::Test
  def setup
    @bun = Bun.new
    @options = ["whole wheat", "gluten-free", "tortilla"]
  end

  def test_respond_to_select
    assert_respond_to @bun, :select
  end
  
  # receives argument
  
  def test_respond_to_prompt
    assert_respond_to @bun, :prompt
  end

  # def test_prompts_bun_options
  # end

  # def test_displays_bun_options
  # end

  # def test_selects_correct_bun_option
  # end
end