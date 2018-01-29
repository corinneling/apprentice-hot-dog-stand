require_relative './hot_dog.rb'
require_relative '../helpers'

class Order
  attr_reader :hot_dogs

  def initialize
    # Extendable to order multiple hot dogs
    @hot_dogs = []
  end

  def place_order!
    hot_dog = HotDog.new

    print_options_menu(:type_menu, TYPE_OPTIONS)
    hot_dog.choose_type(get_index(CONDIMENT_OPTIONS))

    print_options_menu(:bun_menu, BUN_OPTIONS)
    hot_dog.choose_bun(get_index(BUN_OPTIONS))

    hot_dog.choose_condiments

    @hot_dogs << hot_dog
  end

  def bun_grammar_check(bun)
    case
    when bun == nil then "no bun"
    when bun != nil then "a #{bun} bun"
    end
  end

  def condiment_grammar_check(condiments)
    case
    when condiments.length == 1 then condiments[0]
    when condiments.length == 2 then condiments.first + " and " + condiments.last
    when condiments.length > 2 then condiments[0..-2].join(", ") + ", and " + condiments.last
    end
  end

  def to_s(hot_dog)
    puts
    p "Your order of a #{hot_dog.type} hotdog on #{bun_grammar_check(hot_dog.bun)} along with #{condiment_grammar_check(hot_dog.condiments)} is coming up!"
  end
end
