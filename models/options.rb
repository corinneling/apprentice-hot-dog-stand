class Options
  attr_reader :menu, :meats, :buns, :condiments
  
  def initialize
    @menu = ["quit", "place an order"]
    @meats = ["polish", "beef", "jalepano", "tofu", "mystery meat"]
    @buns = ["hold the bun", "whole wheat", "gluten-free", "tortilla"]
    @condiments = ["none", "ketchup", "mustard", "relish", "horseradish", "onions", "sauerkraut"]
  end
end