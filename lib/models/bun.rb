require './lib/models/options'

class Bun < Options
  # Inherits #length, #prompt, #show, and #select from Options
  
  def initialize
    @option = 'bun'
    @options = ["whole wheat", "gluten-free", "tortilla"]
    @selection = nil
  end
end