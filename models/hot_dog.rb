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
    @type = HOT_DOG_OPTIONS[get_index(HOT_DOG_OPTIONS)] 
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
    
    condiment_options = CONDIMENT_OPTIONS
    print_options('condiments', condiment_options)
    
    until condiment_options.length < 3
      index = get_index(condiment_options)
      
      if index.zero?
        break
      elsif index.between?(1, condiment_options.length - 1)
        print_options('condiments', condiment_options)
        pulled_choice = condiment_options.fetch(index)
        condiment_options.delete_at(index)
        @condiments.push(pulled_choice)
      else
        print_error(:option)
        print_prompt      
      end
    end
  end
end
