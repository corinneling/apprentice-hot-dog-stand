require_relative '../helpers'

class UserInput
  def self.get_index(options)
    begin
      index = Integer(gets.chomp)
    rescue ArgumentError, TypeError
      print_error(:type)
      self.get_index(options)
    end
  end

  def self.void?(i)
    i.nil? || i.zero?
  end

  def self.valid_index?(i, min, max)
    i.between?(min, max)
  end
end
