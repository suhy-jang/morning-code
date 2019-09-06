def partition(array)
  pivot = array[0]
  lefts = get_combine(array, pivot, -1)
  rights = get_combine(array, pivot, 1)
  lefts.concat([pivot], rights)
end

def get_combine(array, pivot, sign)
  array.each_with_object(Array.new) do |element, new_arr| 
    new_arr << element if sign * (element - pivot) > 0
  end
end

p partition([4, 5, 3, 9, 1])
# => [3, 1, 4, 5, 9]
