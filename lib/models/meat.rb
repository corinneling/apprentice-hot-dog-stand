require './lib/models/options'

class Meat < Options
  # Inherits #prompt, #show, and #select from Options

  def initialize
    @option = 'meat'
    @options = ['polish', 'beef', 'jalepano', 'tofu', 'mystery meat']
    @selection = nil
  end
end