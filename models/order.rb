require_relative './hot_dog.rb'

class Order
  attr_reader :order

  def initialize
    @order = {}
  end

  def place_order
    puts "Inside Order#place_order"
    # choose_hotdog
    # choose_bun
    # choose_condiments

    # @order # returns order
  end

end