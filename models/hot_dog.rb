class HotDog
  attr_accessor :meat, :bun, :condiments

  def initialize
    @meat = nil 
    @bun = nil
    @condiments = []
  end


  def condiments=(condiment)
    # FIX: better way to update condiments
    @condiments << condiment
  end
end
