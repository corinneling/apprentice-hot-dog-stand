require_relative '../helpers'
require_relative '../constants'

class HotDog
  attr_accessor :type, :bun, :condiments

  def initialize
    @type = nil
    @bun = nil
    @condiments = []
  end

  def choose_type(index)
    @type = HOT_DOG_OPTIONS[index]
  end
  
  def choose_bun(index)
    @bun = BUN_OPTIONS[index] unless index.zero?
  end
  
  def choose_condiment(index)
    @condiments << CONDIMENT_OPTIONS[index]
  end
end
