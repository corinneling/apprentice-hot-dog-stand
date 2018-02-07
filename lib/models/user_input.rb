class UserInput
  attr_reader :input, :min, :max

  def initialize(min, max)
    @min = min
    @max = max
    @input = get_input
  end

  def valid?
    return false unless integer?(input)
    input.to_i.between?(min, max)
  end

  private

  def get_input
    gets.chomp
  end

  def integer?(input)
    input.match(/\d/)
  end
end