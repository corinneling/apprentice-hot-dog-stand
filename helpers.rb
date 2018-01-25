PROMPT = "--> "
DIVIDER = "#{'-' * 80}"
OPTION_ERROR = "\nWe don't offer that here. \nPlease enter a valid option."

def print_choices(item, choices) 
  puts "What type of #{item} would you like?"
  puts DIVIDER

  choices.each_with_index do |choice, index|
    puts "[ #{index} ] #{choice}" 
  end
end

