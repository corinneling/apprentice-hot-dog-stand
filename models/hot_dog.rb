class HotDog
  attr_reader :type, :bun, :condiments

  def initialize
    @hot_dog = nil
    @bun = nil
    @condiments = nil
  end

  $error_message = "\nWe don't offer that here. \nPlease enter a valid option.\n----------------------------\n"
  $prompt = "-->"

  def choose_type
    puts "Inside HotDog#choose_type"

    #variables
    dog_type = ["Polish", "Beef", "Jalepano", "Tofu"]
    dog_confirmation = "Thank you for choosing a hot dog type!\nNow let\'s figure out what kind of bun you want."

    # Asks the user a question
    puts "\nWhat type of hotdog would you like?\n-----------------------------------"

    # prints out each item of the array to the command line
    dog_type.each_with_index do |dog, index|
        puts "[ #{index} ] #{dog}"
    end

    # ask the user for input and turn input into an integer
    print prompt
    user_input_dog = $stdin.gets.chomp.to_i

    # checks to see whether we can move onto choosing a bun
    if user_input_dog.between?(1, 4)
      puts dog_confirmation
      # will start the choose_bun method
      choose_bun
    else
      while user_input_dog > 4
        puts error_message
        print prompt
        user_input_dog = gets.chomp.to_i
      end
      puts dog_confirmation
      # will start the choose_bun method
      choose_bun
    end
    order << "#{dog}"
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
