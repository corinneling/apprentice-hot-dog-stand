require_relative './constants'

def clear
  system "clear"
end

<<<<<<< HEAD
def print_option_menu(menu_item, options)
=======
def print_options_menu(menu_item, options)
>>>>>>> refactor: print methods
  print_question(menu_item)
  print_options(options)
end

def print_options(options) 
  options.each_with_index do |option, index|
<<<<<<< HEAD
  puts "[ #{index} ] #{option}" 
end


def print_question(menu_item)
  if menu_item == :menu
=======
    puts "[ #{index} ] #{option}" 
  end
  
  print_prompt
end


def print_question(menu_item)
  if menu_item == :main_menu
>>>>>>> refactor: print methods
    puts "Would you like to order a hot dog today?"
  else
    puts "What #{menu_item} would you like?"
  end
  
  puts DIVIDER
<<<<<<< HEAD
end


  print_prompt
=======
>>>>>>> refactor: print methods
end

def print_prompt
  print PROMPT
end

def print_error(error_type)
  case error_type
  when :option
    puts OPTION_ERROR
  when :type
    puts TPYE_ERROR
  else
    puts "Unknown error"
  end
end

def get_index(options)
  begin
    index = Integer(gets.chomp)
    # raise RangeError unless options.include?(options[index])
  rescue ArgumentError, TypeError
    print_error(:type)
    get_index(options)
  # rescue RangeError
    # print_error(:option)
    # get_index(options)
  end

  # index
end
