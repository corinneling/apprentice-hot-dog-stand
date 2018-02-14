require './lib/models/order'

class MenuController
  def initialize
    @order = Order.new
  end

  def show_menu
    @order.create
    @order.show
  end

  # REFACTOR/MOVE CODE BELOW:
  # # Move to Order class

  # def print_order
  #   puts
  #   puts
  #   puts Helpers::DIVIDER
  #   puts "Your order of a #{hot_dog.meat} hot dog on #{bun_grammar_check(hot_dog.bun)} #{condiment_grammar_check(hot_dog.condiments)}is coming up!"
  #   puts Helpers::DIVIDER
  # end

  def self.bun_grammar_check(bun)
    case
    when bun == nil then "no bun"
    when bun != nil then "a #{bun} bun"
    end
  end

  def self.condiment_grammar_check(condiments)
    case
    when condiments.length == 1 then "with #{condiments[0]} "
    when condiments.length == 2 then "along with #{condiments.first} and #{condiments.last} "
    when condiments.length > 2 then "along with #{condiments[0..-2].join(", ")}, and #{condiments.last} "
    else "with no condiments"
    end
  end
end
