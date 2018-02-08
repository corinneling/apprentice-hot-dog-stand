require './lib/models/meat'
require './lib/models/bun'
require './lib/models/condiments'
require './lib/models/user_input'

class Order
  attr_accessor :options

  def initialize
    @ingredients = { 
      meat: Meat.new, 
      bun: Bun.new, 
      condiments: Condiments.new
    }
  end
  
  def create
    puts "#CREATE"
    puts

    @ingredients.each do |key, ingredient|
      ingredient.prompt
      ingredient.show
      puts

      input = UserInput.new(ingredient.options.length)
      ingredient = ingredient.select(input)
    end

    @ingredients
  end

  def show
    p @ingredients
  end

  # def create_hot_dog
  #   # Hot dog options
  #   type_question = -> { puts "What kind of meat would you like?" }
  #   print_options_menu(type_question, options.meats)

  #   input = UserInput.new(0, options.meats.length)
  #   hot_dog.meat = options.select_meat_at(input.value)

  #   # Bun options
  #   bun_question = -> { puts "What kind of bun would you like?" }
  #   print_options_menu(bun_question, options.buns)

  #   input = UserInput.new(0, options.buns.length)
  #   hot_dog.bun = options.select_bun_at(input.value) unless input.value.zero?

  #   # Condiment options
  #   condiments_question = -> { puts "What kind of condiments would you like?" }
  #   print_options_menu(condiments_question, options.condiments)

  #   until options.condiments.length < 2
  #     input = UserInput.new(0, options.condiments.length)
      
  #     break if input.value.zero?

  #     hot_dog.condiments << options.select_condiment_at(input.value)

  #     Helpers.clear
  #     print_options_menu(condiments_question, options.condiments)
  #   end

  #   hot_dog
  # end
end