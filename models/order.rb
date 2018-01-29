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

  def to_s(hot_dog)
    p hot_dog
  end
end
