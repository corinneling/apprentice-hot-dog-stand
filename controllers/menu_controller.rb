require_relative '../models/hot_dog'
require_relative '../helpers'
require_relative '../models/options'

class MenuController < Options
  attr_reader :hot_dog, :options

  def initialize
    @options = Options.new
    @hot_dog = HotDog.new
  end

  def show_menu
    menu_question = -> { puts "Would you like to order a hot dog today?" }
    print_options_menu(menu_question, options.menu)
    input = get_index(options.menu)

    until input.between?(0, options.menu.length)
      print_error(:option)
      input = get_index(options.menu)
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
    # Hot dog options
    type_question = -> { puts "What kind of meat would you like?" }
    print_options_menu(type_question, options.meats)

    index = get_index(options.meats)
    hot_dog.meat = options.select_meat_at(index)

    # Bun options
    bun_question = -> { puts "What kind of bun would you like?" }
    print_options_menu(bun_question, options.buns)

    index = get_index(options.buns)
    hot_dog.bun = options.select_bun_at(index)

    # Condiment options
    condiments_question = -> { puts "What kind of condiments would you like?" }
    print_options_menu(condiments_question, options.condiments)
    
    until options.condiments.length < 2
      index = get_index(options.condiments)
      break if void?(index)

      if valid_index?(index, 1, options.condiments.length)
        hot_dog.condiments << options.select_condiment_at(index)
        clear
        print_options_menu(condiments_question, options.condiments)
      else
        print_error(:option) &&  next
      end
    end

    hot_dog
  end

  def print_order
    puts "Your order of a #{hot_dog.meat} hot dog on #{bun_grammar_check(hot_dog.bun)} #{condiment_grammar_check(hot_dog.condiments)}is coming up!"
  end
end
