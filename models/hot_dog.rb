require_relative '../helpers'
require_relative '../constants'

class HotDog
  attr_reader :type, :bun, :condiments

  def initialize
    @type = nil
    @bun = nil
    @condiments = []
  end

  def choose_type(index)
    @type = HOT_DOG_OPTIONS[index]
  end

  def choose_bun(index)
    @bun = BUN_OPTIONS[index] unless index.zero?
  end

  def choose_condiments
    condiment_options = CONDIMENT_OPTIONS
    print_options_menu(:condiments, condiment_options)

    until condiment_options.length < 2
      index = get_index(condiment_options)
      break if index.zero?

      if index.between?(1, condiment_options.length)
        pulled_choice = condiment_options[index]
        condiment_options.delete_at(index)

        print_options_menu(:condiments, condiment_options)

        @condiments.push(pulled_choice)
      else
        print_error(:option)
        print_prompt     
      end
    end
  end
end
