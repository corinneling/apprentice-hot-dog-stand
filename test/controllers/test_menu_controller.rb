require './lib/controllers/menu_controller'

class TestedMenuController < MenuController

  def print_options_menu(question_lambda, options)

  end

  def quit_menu

  end

  def get_index(options)
    0
  end
end

class MenuControllerTest < Minitest::Test
  # def test_canary
  #   assert true
  # end

  # def test_menu_controller_can_be_created
  #   MenuController.new
  # end

  # def test_can_quit_application
  #   # Arrange
  #   menu = TestedMenuController.new
  #   # Act
  #   result = menu.show_menu
  #   # Assert
  # end
end
