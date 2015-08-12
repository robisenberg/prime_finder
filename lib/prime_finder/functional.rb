require_relative '../core_extensions'

module PrimeFinder
  class Functional
    def self.find(quantity:, start_value: 1)
      case quantity
        when 1
          [find_prime_larger_than(start_value)]
        else
          latest_prime = find_prime_larger_than(start_value)
          [latest_prime] + find(quantity: quantity - 1, start_value: latest_prime + 1)
      end
    end
    
    def self.find_prime_larger_than(value)
      case
      when value.prime? then value
      else find_prime_larger_than(value + 1)
      end  
    end
  end
end
