require_relative '../models/order'

class MenuController
  def initialize
    @order = Order.new
  end

  # Menu options
  def show_menu
    puts "Inside MenuController#show_menu"

    puts "\nWhat are you looking for today?\n-------------------------------"

    # menu is an array, each item is put onto the screen
    ["[ 1 ] Place an order", "[ 2 ] Quit"].each do |items|
      puts items
    end

    # ask the user for input and turn input into an integer
    print "--> "
    user_input = $stdin.gets.chomp.to_i

    # takes you to the place order prompt, clears screen, or show error
    case user_input
    when 1
      @order.place_order!
      print_order
    when 2
      puts "Goodbye, hope to see you again!"
      exit(0)
    else
      while user_input > 2
        puts "\nWe don't offer that here. \nPlease enter a valid option.\n----------------------------\n"
        print "--> "
        user_input = gets.chomp.to_i
      end
    end
  end

  def print_order
    @order.hot_dogs.each do |hot_dog|
      @order.to_s(hot_dog)
    end
  end
end
