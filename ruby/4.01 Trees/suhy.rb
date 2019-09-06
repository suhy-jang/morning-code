def leftmost_nodes_sum(array)
  i=0
  sum=0
  exp = 2**i-1
  while exp < array.size do
    sum += array[exp]
    i+=1
    exp = 2**i-1
  end
  sum
end

puts leftmost_nodes_sum([2, 7, 5, 2, 6, 0, 9])
# => 11
