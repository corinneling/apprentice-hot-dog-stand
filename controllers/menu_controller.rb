require_relative '../models/hot_dog'
require_relative '../helpers.rb'

class MenuController
  def initialize
    @hot_dog = HotDog.new
    @condiment_options = CONDIMENT_OPTIONS
  end

  def show_menu
    menu_question = -> { puts "Would you like to order a hot dog today?" }
    print_options_menu(menu_question, MENU_OPTIONS)
    input = get_index(MENU_OPTIONS)

    until input.between?(0, MENU_OPTIONS.length)
      print_error(:option)
      input = get_index(MENU_OPTIONS)
    end

    if input == 1
      self.create_hot_dog
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
    @hot_dog.choose_type(get_index(HOT_DOG_OPTIONS))
    
    # Bun options
    bun_question = -> { puts "What kind of bun would you like?" }
    print_options_menu(bun_question, BUN_OPTIONS) 
    @hot_dog.choose_bun(get_index(BUN_OPTIONS))
    
    # Condiment options
    condiments_question = -> { puts "What would you like on your hot dog?" }
    print_options_menu(condiments_question, @condiment_options)
    
    until @condiment_options.length < 2
      index = get_index(@condiments_options)
      break if index.nil? || index.zero?
      
      if index.between?(1, CONDIMENT_OPTIONS.length)
        @hot_dog.choose_condiment(index)
        @condiment_options[index] = nil
        clear
        print_question(condiments_question)
        print_options(@condiment_options)
      else
        print_error(:option)
        next
      end
    end

    @hot_dog
  end

  def print_order
    p @hot_dog
    # @order.hot_dogs.each do |hot_dog|
      # @order.to_s(hot_dog)
    # end
  end
end
