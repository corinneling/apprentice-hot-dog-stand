require_relative '../models/order'
require_relative '../helpers.rb'

class MenuController
  def initialize
    @order = Order.new
  end

  def show_menu
    print_options_menu(:main_menu, MENU_OPTIONS)
    input = get_index(MENU_OPTIONS)

    until input.between?(0, MENU_OPTIONS.length)
      print_error(:option)
      input = get_index(MENU_OPTIONS)
    end

    if input == 1
      @order.place_order!
      print_order
    else
      puts "Goodbye, hope to see you again!"
      exit(0)
    end
  end

  def print_order
    @order.hot_dogs.each do |hot_dog|
      @order.to_s(hot_dog)
    end
  end
end
