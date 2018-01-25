require_relative '../helpers.rb'

class HotDog
  attr_reader :type, :bun, :condiments

  def initialize
    @type = nil
    @bun = nil
    @condiments = []
  end

  def choose_type
    puts 'Inside HotDog#choose_type'

    # Asks the user a question
    puts "\nWhat type of hot dog would you like?"
    puts PROMPT

    # prints out each item of the array to the command line
    ["Polish", "Beef", "Jalepano", "Tofu", "Mystery Meat"].each_with_index do |items, index|
      puts "[ #{index} ] #{items}"
    end

    # ask the user for input
    print "-->"
    user_input_dog = gets.chomp.to_i

    # returns an error if input is a string
    if user_input_dog.is_a? String
      puts "That's some shenanigans. Please, choose a number."
    end

    # validates and stores item in @type
    case user_input_dog
    when 0
      @type = "Polish"
    when 1
      @type = "Beef"
    when 2
      @type = "Jalepano"
    when 3
      @type = "Tofu"
    when 4
      @type = "Mystery Meat"
    else
      while @type > 4
        puts OPTION_ERROR
        puts PROMPT
        @type = gets.chomp.to_i
      end
    end
  end

  def choose_bun
    puts "Inside HotDog#choose_bun"

    buns = ["Hold the bun.", "Whole wheat", "Gluten-free", "Tortilla"]
    print_choices('bun', buns)

    bun_index = gets.chomp.to_i
    @bun = buns[bun_index] unless bun_index.zero?
  end

  def condiment_choices(question, answers)
    if question == :intro
      puts "\nWhat condiments would you like?\n-----------------------------------" # outputs on the first time user encounters condiments section
    elsif question == :more
      puts "\nAny more?\n-----------------------------------"                       # outputs after user chooses a condiment
    end
    answers.each_with_index do |ans, index|
      puts "[ #{index} ] #{ans}"                                                    # outputs avaliable condiment options
    end
  end

  def choose_condiments
    options = %w[none ketchup mustard relish horseradish onions sauerkraut]         # condiment options
    condiment_choices(:intro, options)                                              # run 'condiments_choices' method

    loop do                                                                         # loop
      print "\n --> "
      user_input = Integer($stdin.gets.chomp)                                       # take user's input and convert to integer

      if user_input.between?(1, options.length - 1)                                 # if user's input is valid
        pulled_choice = options.fetch(user_input)                                   # store user's condiment
        puts "\nAdding " + pulled_choice + "..."                                    # let user know condiment is being added
        options.delete_at(user_input)                                               # remove condiment form avaliable options
        @condiments.push(pulled_choice)                                             # push user's condiment to 'choices' array
      elsif user_input === 0                                                        # if user's input is 'none / no more'
        break                                                                       # break the loop
      else                                                                          # else...
        puts "Please enter a valid option\n-----------------------------------"     # tell user to enter a valid option
      end                                                                           # end

      options.any? ? condiment_choices(:more, options) : break                      # if any condiments in 'options' array, run 'condiment_choices' method : else break loop
    end

    puts 'Adding your condiments...'
  end
end
