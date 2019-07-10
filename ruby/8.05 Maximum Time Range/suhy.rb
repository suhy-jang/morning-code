

def maximum_time_range(array)
  # write your code here
  ranges = get_ranges(array)
  only_range = Array.new
  ranges.each do |range|
    (range[0]...range[1]).each do |time|
      only_range << time
    end
  end
  only_range = only_range.uniq.sort
  
  index = 0
  results = Array.new
  while index < only_range.size do
    start_index = only_range[index]
    while index + 1 < only_range.size && only_range[index] + 1 == only_range[index + 1]
      index += 1
    end
    end_index = only_range[index] + 1
    results << [start_index, end_index]
    index += 1
  end
  return results.flatten if results.size == 1
  results
end

def get_ranges(array)
  index = 0
  ranges = Array.new
  until index >= array.size do
    ranges << [array[index], array[index + 1]]
    index += 2
  end
  ranges
end

p maximum_time_range([10, 18, 4, 6, 14, 16, 5, 8])
# => [[4, 8], [10, 18]]
