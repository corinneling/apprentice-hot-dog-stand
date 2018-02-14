require './lib/helpers'

class Options
  attr_reader :options, :selection

  def initialize
    @options = []
    @selection = nil
  end

  def prompt(ingredient)
    puts "What kind of #{ingredient} would you like?"
    puts Helpers::DIVIDER
  end

  def show
    @options.each_with_index do |option, index|
      puts "[ #{index + 1} ] #{option}"
    end

    print Helpers::PROMPT
  end

  def select(input)
    sentence_fragment(@options[input.get])
  end
end
