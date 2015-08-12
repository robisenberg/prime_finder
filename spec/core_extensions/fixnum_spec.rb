require_relative '../../lib/core_extensions/fixnum'

module CoreExtensions
  module Fixnum

    describe Factoring do

      before do
        ::Fixnum.include CoreExtensions::Fixnum::Factoring
      end
      
      describe "#factor_of?" do

        context 'when the potential factor is a factor' do
          it 'returns true' do
            expect(2.factor_of?(16)).to be
          end
        end

        context 'when the potential factor is not a factor' do
          it 'returns false' do
            expect(3.factor_of?(16)).to_not be
          end
        end

        context 'when the potential factor equals the value' do
          it 'returns true' do
            expect(5.factor_of?(5)).to be
          end
        end

        context 'when the potential factor is 1' do
          it 'returns true' do
            expect(1.factor_of?(2)).to be
          end
        end

        context 'when the potential factor is 0' do
          it 'returns false' do
            expect(0.factor_of?(2)).to_not be
          end
        end

        context 'when the potential factor is negative' do
          it 'returns false' do
            expect(-1.factor_of?(2)).to_not be
          end
        end

        context 'when the number being checked for factors is 0' do

          context 'when the potential factor is also 0' do
            it 'returns true' do
              expect(0.factor_of?(0)).to be
            end
          end

          context 'when the potential factor is 1' do
            it 'returns true' do
              expect(0.factor_of?(0)).to be
            end
          end

          context 'when the potential factor is anything else' do
            def find_factors_of(value, potential_factors:)
              potential_factors.reject{|potential_factor| !potential_factor.factor_of?(value) }
            end

            it 'returns true' do
              expect(find_factors_of 0, potential_factors: 0..10).to eq (0..10).to_a
            end
          end
        end

        context 'when the number being checked for factors is negative' do

          context 'when the potential factor is a factor' do
            it 'returns true' do
              expect(2.factor_of?(-2)).to be
            end
          end

          context 'when the potential factor is not a factor' do
            it 'returns false' do
              expect(2.factor_of?(-3)).to_not be
            end
          end

        end
        
        describe 'test with larger result set' do

          def only_if_factorisable_by(values:, factor:)
            values.reject{|value| !factor.factor_of?(value) }
          end

          it 'correctly identifies numbers for which the potential factor is a factor' do
            expect(only_if_factorisable_by(values: -10..10, factor: 2)).to eq([-10, -8, -6, -4, -2, 0, 2, 4, 6, 8, 10])
          end

        end
        
      end

      describe '#prime?' do
        
        context 'when a prime number' do
          it 'returns true' do
            expect(3.prime?).to be
          end
        end

        context 'when not a prime number' do
          it 'returns false' do
            expect(6.prime?).to_not be
          end
        end

        context 'when two' do
          it 'returns true' do
            expect(2.prime?).to be
          end
        end

        context 'when one' do
          it 'returns false' do
            expect(1.prime?).to_not be
          end
        end

        context 'when negative' do
          it 'returns false' do
            expect(-3.prime?).to_not be
          end
        end

        describe 'test with larger result set' do

          def only_primes(from:)
            from.reject{|i| !i.prime? }
          end

          it 'correctly identifies numbers divisible by the factor' do
            expect(only_primes(from: -10..15)).to eq([2, 3, 5, 7, 11, 13])
          end
        end

      end

      describe '#has_non_prime_factor?' do

        context 'when the number has a non-prime factor' do
          it 'returns true' do
            expect(4.has_non_prime_factor?).to be
          end
        end

        context 'when the number has no non-prime factor' do
          it 'returns false' do
            expect(3.has_non_prime_factor?).to_not be
          end
        end

        context 'value is 0' do
          it 'returns true' do
            expect(0.has_non_prime_factor?).to be
          end
        end
      end

      def smallest_factor(exclude: []) 
        (1..self).each do |current_value|
          next if exclude.include?(current_value)
          return current_value if current_value.factor_of?(self)
        end
        nil
      end

      describe '#smallest_factor' do

        context 'with non-zero values' do
          it 'returns the smallest factor' do
            expect(5.smallest_factor).to eq(1)
          end

          context 'when the smallest factor is excluded' do
            it 'returns the next smallest factor' do
              expect(5.smallest_factor exclude: [1]).to eq 5
            end
          end

          context 'when no factor can be found' do
            it 'returns nil' do
              expect(5.smallest_factor(exclude: [1,5])).to be_nil
            end
          end
        end

        context 'for zero' do
          it 'raises UndefinedResultException' do
            expect{0.smallest_factor}.to raise_exception{Factoring::UndefinedResultException}
          end
        end
      end
      
    end
    
  end
end
