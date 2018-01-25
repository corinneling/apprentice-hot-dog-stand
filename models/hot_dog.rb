class HotDog
  attr_reader :type, :bun, :condiments

  def initialize
    @hot_dog = nil
    @bun = nil
    @condiments = nil
  end

  def choose_type
    puts "Inside HotDog#choose_type"
    @hot_dog = "beef"
  end

  def choose_bun
    puts "Inside HotDog#choose_bun"
    @bun = "wheat"
  end

  def choose_condiments
    puts "Inside HotDog#choose_condiments"
    @condiments = ["Ketchup", "mustard"]
  end
end