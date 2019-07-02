def simple_quicksort(array)
  return array if array.length <= 1

  pivot = array[0]
  lefts = get_combine(array, pivot, -1)
  rights = get_combine(array, pivot, 1)
  
  combine = simple_quicksort(lefts) + [pivot] + simple_quicksort(rights)
  print_result(combine)
  combine
end

def get_combine(array, pivot, sign)
  array.each_with_object(Array.new) do |element, new_arr| 
    new_arr << element if sign * (element - pivot) > 0
  end
end

def print_result(array)
  print array.join(" ") + "\n"
end

p simple_quicksort([9, 8, 6, 7, 3, 5, 4, 1, 2])
# p simple_quicksort([5, 8, 1, 3, 7, 10, 2])
# => 2 3
#    1 2 3
#    7 8 10
#    1 2 3 5 7 8 10
