require_relative './constants'

def clear
  system "clear"
end

def print_options_menu(question_lambda, options)
  print_question(question_lambda)
  print_options(options)
end

def print_options(options)
  options.each_with_index do |option, index|
    puts "[ #{index} ] #{option}"
  end

  print_prompt
end

def print_question(question_lambda)
  puts
  question_lambda.call
  
  puts DIVIDER
end

def print_prompt
  print PROMPT
end

def print_error(error_type)
  case error_type
  when :option
    puts OPTION_ERROR
  when :type
    puts TYPE_ERROR
  else
    puts "Unknown error"
  end

  print_prompt
end

def get_index(options)
  begin
    index = Integer(gets.chomp)
  rescue ArgumentError, TypeError
    print_error(:type)
    get_index(options)
  end
end
