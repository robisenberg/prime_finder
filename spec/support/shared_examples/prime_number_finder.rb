shared_examples_for 'a prime number finder' do
  describe '.find' do

    context 'with the default start_value of 1' do

      it 'returns the specified quantity of prime numbers starting from 1' do
        expect(described_class.find quantity: 20).to eq(::PrimeExamples.first_20)
      end
    end

    context 'with a higher start value' do

      it 'returns the specified quantity of prime numbers starting from that value' do
        expect(described_class.find quantity: 3, start_value: 5).to eq([5, 7, 11])
      end

    end

  end
end