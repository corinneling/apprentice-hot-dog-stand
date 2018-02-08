require './lib/helpers'

class UserInput
  def initialize(max)
    @max = max
  end

  def get
    validate(gets.chomp)
  end

  private

  def validate(index)
    if integer?(index) && index.to_i.between?(0, @max)
      return index.to_i
    else
      Helpers.print_error(:option)
      get
    end
  end

  def integer?(index)
    index.to_i.to_s == index
  end
end