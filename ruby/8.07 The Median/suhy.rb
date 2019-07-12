require 'set'

def median(array)
  size = array.size
  lowers = SortedSet.new
  highers = SortedSet.new
  median_num = array.first
  array.each do |number|
    if number <= median_num
      lowers.add(number)
    else
      highers.add(number)
    end
    if lowers.length >= highers.length
      if lowers.length > highers.length + 1
        temp = lowers.to_a.last
        highers.add(temp)
        lowers.delete(temp)
      end
      median_num = lowers.to_a.last
    elsif lowers.length < highers.length
      if highers.length > lowers.length + 1
        temp = highers.to_a.first
        lowers.add(temp)
        highers.delete(temp)
      end
      median_num = highers.to_a.first
    end
  end # each
  median_num
end

puts median([0, 1, 2, 4, 6, 5, 3])
# => 3
