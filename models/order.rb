require_relative './hot_dog.rb'

class Order
  attr_reader :hot_dogs

  def initialize
    # Extendable to order multiple hot dogs
    @hot_dogs = []
  end

  def place_order!
    hot_dog = HotDog.new
    hot_dog.choose_type
    hot_dog.choose_bun
    hot_dog.choose_condiments

    @hot_dogs << hot_dog
  end

  def to_s(hot_dog)
    puts "#to_s"
    p hot_dog
  end
end
