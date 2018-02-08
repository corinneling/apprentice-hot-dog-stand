class Options
  attr_reader :options
  
  def initialize
    @options = []
  end

  def prompt
    puts "PROMPT: #{@options}"
  end

  def show
    puts "SHOW: #{@options}"
  end

  def select(input)
    @options[input.get]
  end
end