def exact_sum?(k, coins)
  return true if k == 0
  return false if coins.empty? || k < 0
  exact_sum?(k-coins[0], coins[1..-1]) || exact_sum?(k, coins[1..-1])
end

puts exact_sum?(50, [1, 3, 5, 37, 18, 5])
#puts exact_sum?(51, [8, 12, 15, 7, 11, 14])
