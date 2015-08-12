# Prime Finder

This library can be used to find an arbitrary number of prime numbers.

## Usage

### Command-line Interface (CLI)

This library provides a CLI for interacting with it on the command line. For usage details, run:

```
$ ruby bin/primes
```

You can also ask for usage details on a particular command (including options):

```
$ ruby bin/primes help [COMMAND]
```

Finally, you can run the CLI script without calling `ruby` by running:

```
$ chmod +x bin/primes
```

### Finding Primes

```
$ ruby bin/primes find --count 10
```


### Multiplication Tables

Generates a multiplication table of prime numbers.

```
$ ruby bin/primes multiply --count 10
```

### Running the tests

The default rake tasks will run them.

```
$ rake
```

or 

```
$ rake spec
```

# Performance

## Optimisations

There's always a tradeoff/tension between clear, readable code and performance.

There are optimisations that could be made to the prime finding algorithm. However, without specific requirements around performance, I chose not to make those optimisations as they would have added complexity and reduced the clarity of the code.

My preference is always to write simple, clear, readable code first, and then optimise afterwards if necessary. The `Integer#prime?` method exemplifies this clarity:

```ruby
def prime?
  self == 2 || (self > 1 && !has_non_prime_factor?)
end
```

## Algorithm: Procedural vs Functional

This current version ships with two different prime finding algorithms (mainly because I was curious about which version would perform better). By default, the procedural version will be used, but there are options to switch to the functional version.

In terms of performance, there doesn't seem to be much in it. Here's the results for generating 2000 prime numbers (a rehearsal is done to try to avoid skewing result due to garbage collection).

```
Rehearsal ------------------------------------------------
procedural:   10.720000   0.080000  10.800000 ( 11.710994)
functional:   10.890000   0.090000  10.980000 ( 11.482446)
-------------------------------------- total: 21.780000sec

                   user     system      total        real
procedural:   10.560000   0.070000  10.630000 ( 11.899238)
functional:   10.650000   0.070000  10.720000 ( 11.215465)
```

Actually on running the benchmarks multiple times, sometimes procedural wins and sometimes functional wins.

To run the benchmarks, run:

```
$ rake benchmarks
```

# Issues & Improvements

There are a few things that could be improved that I haven't had time to address yet:

1. Lack of tests for CLI

2. Lack of tests for multiplication table generation

3. Improved, more general multiplication table generation
  - currently this is very rough, procedural code that's not particularly clear
  - I've been playing with a number of ideas around this, but haven't settled on a winner
  - it also does not dynamically adjust column widths to fit the size of cells in the table
  - it would be nice to provide more of a pluggable view layer, so if we wanted to output to a different format (e.g. HTML table), it could be done easily with the addition of a single class

4. The prime finding cabability would be best suited as a Prime Finder Gem

5. The multiplication table generator should really be a separate codebase that consumes the Prime Finder library

6. The core extensions should probably be scoped under the `PrimeFinder` module