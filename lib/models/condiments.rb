require './lib/models/options'
require './lib/helpers'

class Condiments < Options
  def initialize
    @options = ["ketchup", "mustard", "relish", "horseradish", "onions", "sauerkraut"]
    @option = "condiments"
    @selection = []
  end

  def select(input)
    until @options.length.zero?
      Helpers.clear
      self.prompt(self.class.to_s.downcase)
      self.show
      index = input.get
      break if index == -1
      selected = @options.delete_at(index)
      @selection << selected unless selected.nil?
    end

    @selection
  end
end