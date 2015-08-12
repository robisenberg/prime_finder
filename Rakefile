begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec)

  task :default => :spec
rescue LoadError
  puts "RSpec is required to run specs"
end

desc 'Run the benchmarks'
task :benchmarks do
  ruby 'benchmark/all.rb'
end