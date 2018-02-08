require './lib/models/order'

class MenuController
  def initialize
    @order = Order.new
  end

  def show_menu
    puts "#SHOW_MENU"
    puts
    @order.create
    # @order.show
  end

  # REFACTOR/MOVE CODE BELOW:

  # Create a Question class
  # def print_options_menu(question_lambda, options)
  #   print_question(question_lambda)
  #   print_options(options)
  # end

  # def print_question(question_lambda)
  #   puts
  #   question_lambda.call

  #   puts Helpers::DIVIDER
  # end

  # def print_options(options)
  #   options.each_with_index do |option, index|
  #     puts "[ #{index} ] #{option}"
  #   end

  #   print Helpers::PROMPT
  # end

  # # Move to Order class

  # def print_order
  #   puts
  #   puts
  #   puts Helpers::DIVIDER
  #   puts "Your order of a #{hot_dog.meat} hot dog on #{bun_grammar_check(hot_dog.bun)} #{condiment_grammar_check(hot_dog.condiments)}is coming up!"
  #   puts Helpers::DIVIDER
  # end

  # def bun_grammar_check(bun)
  #   case
  #   when bun == nil then "no bun"
  #   when bun != nil then "a #{bun} bun"
  #   end
  # end

  # def condiment_grammar_check(condiments)
  #   case
  #   when condiments.length == 1 then "with #{condiments[0]} "
  #   when condiments.length == 2 then "along with #{condiments.first} and #{condiments.last} "
  #   when condiments.length > 2 then "along with #{condiments[0..-2].join(", ")}, and #{condiments.last} "
  #   else condiments
  #   end
  # end
end
