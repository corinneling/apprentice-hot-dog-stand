class Options
  attr_reader :options, :selection
  
  def initialize
    @options = []
    @selection = nil
  end

  def prompt
    puts "PROMPT: #{@options}"
  end

  def show
    puts "SHOW: #{@options}"
  end

  def select(input)
    @selection = @options[input.get]
  end
end