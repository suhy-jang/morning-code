require 'set'
require 'prime'

def sieve_of_eratosthenes(goal_idx)
  Prime::EratosthenesGenerator.new.take_while { |i| i <= goal_idx }
end

def get_set_of_sieve(max_n)
  sieve_of_eratosthenes(max_n).to_set
end

def number_of_primes(arr)
  (get_set_of_sieve(arr.max) & arr).length
end

puts number_of_primes([2, 3, 5, 6, 9])
# => 3

puts number_of_primes([121, 17, 21, 29, 11, 341, 407, 19, 119, 352])
# => 4

puts number_of_primes([7, 6, 7, 3, 77, 14, 28, 35, 42])
# => 3
