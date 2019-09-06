def get_count(arr)
  arr.each_with_object(Hash.new(0)){|n,hash| hash[n] += 1}
end

def appears_most_times(array)
  # write your code here
  hash = get_count(array)
  hash.max_by { |k,v| v }.first
end

puts appears_most_times([1, 2, 3, 1, 5])
# => 1

puts appears_most_times([23, 43, 67, 88, 42, 35, 77, 88, 99, 11])
# => 88

puts appears_most_times([4376, -345, -345, 4376, -345, 84945, 4376, -345, -26509, 4376, 84945, 84945, -26509, 896341, 4376])
# => 4376
