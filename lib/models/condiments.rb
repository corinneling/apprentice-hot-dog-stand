require './lib/models/options'

class Condiments < Options
  def initialize
    @options = [nil, "ketchup", "mustard", "relish", "horseradish", "onions", "sauerkraut"]
    @option = "condiments"
    @selection = []
  end

  def select(input)
    until @options.length == 1
      self.show
      index = input.get
      break if index == 0
      selected = @options.delete_at(index)
      @selection << selected unless selected.nil?
    end

    @selection
  end
end