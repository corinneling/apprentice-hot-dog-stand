require_relative '../helpers'
require_relative '../constants'

class HotDog
  attr_reader :type, :bun, :condiments

  def initialize
    @type = nil
    @bun = nil
    @condiments = []
  end

  def choose_type
    puts
    puts "#choose_type"
    puts

    print_options('hot dog', HOT_DOG_OPTIONS)
    @type = HOT_DOG_OPTIONS[get_index(HOT_DOG_OPTIONS)
  ] 
  end

  def choose_bun
    puts
    puts "#choose_bun"
    puts

    print_options('bun', BUN_OPTIONS)
    index = get_index(HOT_DOG_OPTIONS)
    @bun = BUN_OPTIONS[index] unless index.zero?
  end

  def choose_condiments
    puts
    puts "#choose_condiments"
    puts
    @condiments = CONDIMENT_OPTIONS[1..7]
  end

  # def condiment_choices(question, answers)
  #   if question == :intro
  #     puts "\nWhat condiments would you like?\n-----------------------------------" # outputs on the first time user encounters condiments section
  #   elsif question == :more
  #     puts "\nAny more?\n-----------------------------------"                       # outputs after user chooses a condiment
  #   end
  #   answers.each_with_index do |ans, index|
  #     puts "[ #{index} ] #{ans}"                                                    # outputs avaliable condiment options
  #   end
  # end


  # def choose_condiments
  #   puts
  #   puts "#choose_condiments"
  #   puts
    
  #   condiment_choices(:intro, options)                                              # run 'condiments_choices' method

  #   loop do                                                                         # loop
  #     print "\n --> "
  #     user_input = Integer($stdin.gets.chomp)                                       # take user's input and convert to integer

  #     if user_input.between?(1, options.length - 1)                                 # if user's input is valid
  #       pulled_choice = options.fetch(user_input)                                   # store user's condiment
  #       puts "\nAdding " + pulled_choice + "..."                                    # let user know condiment is being added
  #       options.delete_at(user_input)                                               # remove condiment form avaliable options
  #       @condiments.push(pulled_choice)                                             # push user's condiment to 'choices' array
  #     elsif user_input === 0                                                        # if user's input is 'none / no more'
  #       break                                                                       # break the loop
  #     else                                                                          # else...
  #       puts "Please enter a valid option\n-----------------------------------"     # tell user to enter a valid option
  #     end                                                                           # end

  #     options.any? ? condiment_choices(:more, options) : break                      # if any condiments in 'options' array, run 'condiment_choices' method : else break loop
  #   end

  #   puts 'Adding your condiments...'
  # end
end
