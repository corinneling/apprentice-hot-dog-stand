class HotDog
  attr_reader :type, :bun, :condiments

  def initialize
    @type = nil
    @bun = nil
    @condiments = nil
  end

  $error_message = "\nWe don't offer that here. \nPlease enter a valid option.\n----------------------------\n"
  $prompt = "--> "

  def choose_type
    puts "Inside HotDog#choose_type"

    #variables
    dog_type = ["Polish", "Beef", "Jalepano", "Tofu"]
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
    puts "Inside HotDog#choose_bun"
    @bun = "wheat"
  end

  def choose_condiments
    puts "Inside HotDog#choose_condiments"
    @condiments = ["Ketchup", "mustard"]
  end
end
