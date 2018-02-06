module Helpers
  DIVIDER = "#{'-' * 80}"
  PROMPT = "--> "

  # Move to custom error class
  OPTION_ERROR = "Please enter a valid option"
  TYPE_ERROR = "Please enter a number"

  def self.print_error(error_type)
    case error_type
    when :option
      puts OPTION_ERROR
    when :type
      puts TYPE_ERROR
    else
      puts "Unknown error"
    end
  
    print PROMPT
  end

  def self.clear
    system "clear"
  end
end