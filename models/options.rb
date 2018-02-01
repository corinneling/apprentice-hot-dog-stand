class Options
  attr_reader :menu, :meats, :buns
  attr_accessor :condiments
  
  def initialize
    @menu = ["quit", "place an order"]
    @meats = ["polish", "beef", "jalepano", "tofu", "mystery meat"]
    @buns = ["hold the bun", "whole wheat", "gluten-free", "tortilla"]
    @condiments = ["none", "ketchup", "mustard", "relish", "horseradish", "onions", "sauerkraut"]
  end

  def select_meat_at(index)
    meats[index]
  end

  def select_bun_at(index)
    buns[index]
  end

  def select_condiment_at(index)
    selected = condiments.delete_at(index)
  end
end