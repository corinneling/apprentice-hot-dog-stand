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
    hot_dog.bun = options.select_bun_at(index) unless void?(index)

    # Condiment options
    condiments_question = -> { puts "What kind of condiments would you like?" }
    print_options_menu(condiments_question, options.condiments)
    
    until options.condiments.length < 2
      index = get_index(options.condiments)
      break if void?(index)

      if valid_index?(index, 1, options.condiments.length)
        hot_dog.condiments << options.select_condiment_at(index)
        Helpers.clear
        print_options_menu(condiments_question, options.condiments)
      else
        print_error(:option) &&  next
      end
    end

    hot_dog
  end

  # Print methods

  # Create a Question class
  def print_options_menu(question_lambda, options)
    print_question(question_lambda)
    print_options(options)
  end

  def print_question(question_lambda)
    puts
    question_lambda.call
  
    puts Helpers::DIVIDER
  end

  def print_options(options)
    options.each_with_index do |option, index|
      puts "[ #{index} ] #{option}"
    end
  
    print Helpers::PROMPT
  end

  # Move to UserInput class

  # Move to UserInput class
  
  def get_index(options)
    begin
      index = Integer(gets.chomp)
    rescue ArgumentError, TypeError
      print_error(:type)
      get_index(options)
    end
  end
  
  def void?(i)
    i.nil? || i.zero?
  end
  
  def valid_index?(i, min, max)
    i.between?(min, max)
  end

  # Move to Order class

  def print_order
    puts
    puts
    puts Helpers::DIVIDER
    puts "Your order of a #{hot_dog.meat} hot dog on #{bun_grammar_check(hot_dog.bun)} #{condiment_grammar_check(hot_dog.condiments)}is coming up!"
    puts Helpers::DIVIDER
  end

  def bun_grammar_check(bun)
    case
    when bun == nil then "no bun"
    when bun != nil then "a #{bun} bun"
    end
  end
  
  def condiment_grammar_check(condiments)
    case
    when condiments.length == 1 then "with #{condiments[0]} "
    when condiments.length == 2 then "along with #{condiments.first} and #{condiments.last} "
    when condiments.length > 2 then "along with #{condiments[0..-2].join(", ")}, and #{condiments.last} "
    end
  end
end
