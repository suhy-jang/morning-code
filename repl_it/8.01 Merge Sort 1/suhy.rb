def merge_sort(array1, array2)
  array1_index = array2_index = 0
  merged_array = Array.new
  until array1_index >= array1.size || array2_index >= array2.size do
    if array1[array1_index] <= array2[array2_index]
      merged_array << array1[array1_index]
      array1_index += 1
    else
      merged_array << array2[array2_index]
      array2_index += 1
    end
  end
  
  merged_array.concat(array1[array1_index..-1])
  merged_array.concat(array2[array2_index..-1])
  merged_array
end

p merge_sort([21, 32, 45, 62, 71, 83], [1, 3, 4, 7, 9, 12])

#p merge_sort([1, 3, 9, 11], [2, 4, 6, 8])
# => [1, 2, 3, 4, 6, 8, 9, 11]
