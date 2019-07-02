def advanced_quicksort(array)
  advanced_quicksort_recursive(array, 0, array.length - 1, array.length - 1)
end

def advanced_quicksort_recursive(array, i_start, i_end, i_pivot )
  return array if i_start >= i_end
  i_lg = i_start
  i_start.upto(i_end) do |index|
    if array[index] <= array[i_pivot]
      array[index], array[i_lg] = array[i_lg], array[index]
      i_lg += 1
    end
  end
  i_lg -= 1
  puts array.join(" ")
  advanced_quicksort_recursive(array, i_start, i_lg - 1, i_lg - 1)
  advanced_quicksort_recursive(array, i_lg+1, i_end, i_end)
end

# advanced_quicksort([9, 8, 6, 7, 3, 5, 4, 1, 2])
advanced_quicksort([1, 3, 9, 8, 2, 7, 5])
# => 1 3 2 5 9 7 8
#    1 2 3 5 9 7 8
#    1 2 3 5 7 8 9
