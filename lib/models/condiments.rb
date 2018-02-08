require './lib/models/options'

class Condiments < Options
  def initialize
    @options = ["ketchup", "mustard", "relish", "horseradish", "onions", "sauerkraut"]
    @option = "condiments"
    @selections = []
  end

  def select(input)
    until @options.length < 2
      puts "CONDIMENTS: #{@options}"
      puts "SELECTIONS: #{@selections}"

      index = input.get
      puts "INDEX: #{index}"
      break if index == 0
      selection = @options
      self.show # Options#show
      @selections << @options.delete_at[index]
    end

    @selections
  end
end