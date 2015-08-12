require_relative '../core_extensions'

module PrimeFinder
  class Procedural
    def self.find(quantity:, start_value: 1)
      primes_found = []
      
      possible_candidate = start_value
      
      while primes_found.length < quantity
        primes_found << possible_candidate if possible_candidate.prime?
        possible_candidate += 1
      end
      
      primes_found
    end
  end
end
