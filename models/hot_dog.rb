class HotDog
  attr_reader :type, :bun, :condiments

  def initialize
    @type = nil
    @bun = nil
    @condiments = []
  end

  $error_message = "\nWe don't offer that here. \nPlease enter a valid option.\n----------------------------\n"
  $prompt = '--> '

  def choose_type
    puts 'Inside HotDog#choose_type'

    # variables
    dog_type = %w[Polish Beef Jalepano Tofu]
    dog_confirmation = "Thank you for choosing a hot dog type!\nNow let\'s figure out what kind of bun you want."

    # Asks the user a question
    puts "\nWhat type of hot dog would you like?\n-----------------------------------"

    # prints out each item of the array to the command line
    dog_type.each_with_index do |dog, index|
      puts "[ #{index} ] #{dog}"
    end

    # ask the user for input and turn input into an integer
    print $prompt
    @type = $stdin.gets.chomp.to_i

    # checks to see whether we can move onto choosing a bun
    if @type.between?(1, 4)
      puts dog_confirmation
    else
      while @type > 4
        puts $error_message
        print $prompt
        @type = gets.chomp.to_i
      end
    end

    @type
  end

  def choose_bun
    puts 'Inside HotDog#choose_bun'
    @bun = 'wheat'
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
