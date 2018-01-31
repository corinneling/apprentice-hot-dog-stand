require_relative '../models/hot_dog'
require_relative '../helpers'

class MenuController
  attr_reader :hot_dog

  def initialize
    @hot_dog = HotDog.new
  end

  def show_menu
    menu_question = -> { puts "Would you like to order a hot dog today?" }
    print_options_menu(menu_question, MENU_OPTIONS)
    input = get_index

    until input.between?(0, MENU_OPTIONS.length)
      print_error(:option)
      input = get_index
    end

    if input == 1
      create_hot_dog
      print_order
    else
      puts "Goodbye, hope to see you again!"
      exit(0)
    end
  end

  def create_hot_dog
    condiment_options = CONDIMENT_OPTIONS

    # Hot dog options
    type_question = -> { puts "What kind of hot dog would you like?" }
    print_options_menu(type_question, HOT_DOG_OPTIONS)
    
    hot_dog.meat = get_index

    # Bun options
    bun_question = -> { puts "What kind of bun would you like?" }
    print_options_menu(bun_question, BUN_OPTIONS)

    hot_dog.bun = get_index

    # Condiment options
    condiments_question = -> { puts "What would you like on your hot dog?" }
    print_options_menu(condiments_question, condiment_options)

    until condiment_options.length < 2
      index = get_index
      break if void?(index)

      if choice?(index)
        # FIX change API
        hot_dog.condiments = get_index
        print_options_menu(condiments_question, condiment_options)
      else
        print_error(:option) && next
      end
    end

    hot_dog
  end

  def print_order
    p "Your order of a #{hot_dog.meat} hotdog on #{bun_grammar_check(hot_dog.bun)} #{condiment_grammar_check(hot_dog.condiments)}is coming up!"
  end

  def get_index
    index = gets.chomp.to_i  
    p index
    index
  end
end
