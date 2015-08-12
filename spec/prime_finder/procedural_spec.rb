require_relative '../support/prime_examples'
require_relative '../../lib/prime_finder/procedural'
require_relative '../support/shared_examples/prime_number_finder'

module PrimeFinder
  describe Procedural do

    before do
      ::Fixnum.include CoreExtensions::Fixnum::Factoring
    end

    it_behaves_like 'a prime number finder'
  end
end
