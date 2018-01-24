class HotDog
  attr_reader :type, :bun, :condiments

  def initialize(type, bun, condiments)
    @type = type
    @bun = bun
    @condiments = condiments
  end

  def choose_hot_dog
    puts "Inside HotDog#choose_type"
  end

  def choose_bun
    puts "Inside HotDog#choose_bun"
  end

  def choose_condiments
    puts "Inside HotDog#choose_condiments"
  end
end