require_relative '../helpers'
require_relative 'options'

class HotDog < Options
  attr_reader :meat, :bun, :condiments, :options

  def initialize
    @options = Options.new
    @meat = nil 
    @bun = nil
    @condiments = []
  end

  def meat=(index)
    @meat = options.meats[index] 
  end

  def bun=(index)
    @bun = options.buns[index]
  end

  def condiments=(index)
    @condiments << options.condiments[index]
  end
end
