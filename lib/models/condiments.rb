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
    sentence_fragment(@selection)
  end

  def sentence_fragment(condiments)
    case
    when condiments.length == 1 then @selection = "with #{condiments[0]} "
    when condiments.length == 2 then @selection = "along with #{condiments.first} and #{condiments.last} "
    when condiments.length > 2 then @selection = "along with #{condiments[0..-2].join(", ")}, and #{condiments.last} "
    else @selection = ""
    end
  end
end
