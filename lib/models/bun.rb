require './lib/models/options'

class Bun < Options
  # Inherits #length, #prompt, #show, and #select from Options

  def initialize
    @option = 'bun'
    @options = ["whole wheat", "gluten-free", "tortilla"]
    @selection = nil
  end

  def sentence_fragment(bun)
    @selection = bun == nil ? "no bun" : "a #{bun} bun"
  end
end
