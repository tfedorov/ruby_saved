require_relative 'algorithm.rb'
include Algorithm

begin
  puts('Enter dictionary(separate words with spaces)')
  dictionary = gets.strip

  puts('Enter target')
  target = gets.strip
  puts("Dictionary - '#{dictionary}', Target - '#{target}")
  puts('Result = ')
  puts '['
  puts find_combinations(dictionary.split(' '), target)
  puts('      ]')
  puts('Do You want to exit? [y/n]')
  is_end = gets.strip.downcase
end while is_end != 'y'
