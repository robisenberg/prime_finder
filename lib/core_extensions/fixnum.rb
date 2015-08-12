module CoreExtensions
  module Fixnum
    module Factoring

      class UndefinedResultException < Exception; end
  
      def prime?
        self == 2 || (self > 1 && !has_non_prime_factor?)
      end

      def factor_of?(value)
        value == 0 || (self > 0 && (value % self) == 0)
      end
  
      def has_non_prime_factor?         
        self == 0 || smallest_factor(exclude: [1, self])
      end
  
      def smallest_factor(exclude: [])
        raise UndefinedResultException if self == 0

        (1..self).each do |current_value|
          next if exclude.include?(current_value)
          return current_value if current_value.factor_of?(self)
        end
        nil
      end
    end
  end
end
