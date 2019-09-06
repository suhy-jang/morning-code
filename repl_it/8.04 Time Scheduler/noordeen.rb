def time_scheduler(array)
  # write your code here
  event = []
  (0...array.size).step(2) { |i| event << [array[i], array[i + 1]]}
  res = [event.sort_by! { |i| i[0] }[0]]
  
  event.each do |e|
      res << e && next if e[0] > res[-1][1]
      res[-1] = e if e[1] - e[0] < res[-1][1] - res[-1][0]
  end
  res
end


p time_scheduler([4, 8, 1, 3, 7, 9, 5, 6])
# => [[1,3], [5,6], [7,9]]
