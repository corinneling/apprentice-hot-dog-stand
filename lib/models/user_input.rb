require './lib/helpers'

class UserInput
  attr_reader :min, :max, :value

  def initialize(min, max)
    @min = min
    @max = max
    @value = user_input
  end

  private

  def user_input
    value = gets.chomp
    validate(value)
  end

  def validate(value)
    if integer?(value) && value.to_i.between?(min, max)
      return value.to_i
    else
      Helpers.print_error(:option)
      user_input
    end
  end

  def integer?(value)
    value.to_i.to_s == value
  end
end