require './lib/models/meat'
require './lib/models/bun'
require './lib/models/condiments'
require './lib/models/user_input'

class Order
  attr_accessor :options

  def initialize
    @ingredients = { 
      meat: Meat.new, 
      bun: Bun.new, 
      condiments: Condiments.new
    }
  end
  
  def create
    @ingredients.each do |key, ingredient|
      ingredient.prompt(key)
      ingredient.show

      input = UserInput.new(ingredient.options.length)
      key = ingredient.select(input)
    end

    @ingredients
  end

  def show
    @ingredients.each do |key, ingredient|
      p ingredient.selection
      puts
    end
  end
end