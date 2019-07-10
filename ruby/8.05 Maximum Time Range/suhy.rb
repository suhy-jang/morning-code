def maximum_time_range(array)
  times = get_times(array)
  results = get_times_to_range(times)
  return results.flatten if results.size == 1
  
  results
end

def get_times_to_range(times)
  index = 0
  results = Array.new
  while index < times.size do
    start_index = times[index]
    while index + 1 < times.size && times[index] + 1 == times[index + 1]
      index += 1
    end
    end_index = times[index] + 1
    results << [start_index, end_index]
    index += 1
  end
  results
end

def get_times(array)
  ranges = get_ranges(array)
  times = Array.new
  ranges.each do |range|
    (range[0]...range[1]).each do |time|
      times << time
    end
  end
  times.uniq.sort
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
