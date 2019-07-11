def smallest_difference(array)
  array.sort!
  min_val = nil
  range = nil
  
  array.each_index do |index|
    curr_val = (array[index] - array[index - 1]).abs
    if min_val.nil? || min_val > curr_val
      min_val = curr_val
      range = [array[index - 1], array[index]]
    end
  end
  range
end

p smallest_difference([-20, -3916237, -357920, -3620601, 7374819, -7330761, 30, 6246457, -6461594, 266854])
# => [-20, 30]
