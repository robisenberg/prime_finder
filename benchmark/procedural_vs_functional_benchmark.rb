require 'benchmark'
require_relative '../lib/prime_finder/procedural'
require_relative '../lib/prime_finder/functional'

LABEL_WIDTH = 12

def benchmark_procedural_vs_functional_prime_finding(quantity:)
  puts "\n#{quantity} prime numbers...\n\n"

  Benchmark.bmbm(LABEL_WIDTH) do |benchmark|
    benchmark.report('procedural:') { PrimeFinder::Procedural.find(quantity: quantity) }
    benchmark.report('functional:') { PrimeFinder::Functional.find(quantity: quantity) }
  end

  puts "\n\n\n"
end


benchmark_procedural_vs_functional_prime_finding(quantity: 10)
benchmark_procedural_vs_functional_prime_finding(quantity: 100)
benchmark_procedural_vs_functional_prime_finding(quantity: 2000)
