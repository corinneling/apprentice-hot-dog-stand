require 'minitest/autorun'
require_relative '../models/hot_dog'

class HotDogTest < Minitest::Test
  def setup
    @hot_dog = HotDog.new
    @test_index = 1
  end
  
  class ChooseTypeTest < HotDogTest
  end
  
  class ChooseBunTest < HotDogTest
    def test_returns_a_string
      assert_kind_of(String, @hot_dog.choose_bun(@test_index))
    end
    
    def test_returns_expected_string
      assert_equal(@hot_dog.choose_bun(@test_index), "Whole wheat")
    end

    # TODO: test invalid input
  end
  
  class ChooseCondimentsTest < HotDogTest
  end
end