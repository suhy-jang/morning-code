def merge_sort(array1, array2)
  array1_start = 0
  array1_end = array1.length - 1
  array2_start = 0
  array2_end = array2.length - 1
  array1_index = array2_index = 0
  index = 0
  merged_array = Array.new(array1.length + array2.length, 0)
  until array1_index > array1_end || array2_index > array2_end do
    if array1[array1_index] <= array2[array2_index]
      merged_array[index] = array1[array1_index]
      array1_index += 1
    else
      merged_array[index] = array2[array2_index]
      array2_index += 1
    end
    index += 1
  end
  
  array_copy(array1, array1_index, merged_array, index, (array1_end - array1_index + 1))
  array_copy(array2, array2_index, merged_array, index, (array2_end - array2_index + 1))
  merged_array
end

def array_copy(source_array, source_index, dest_array, dest_index, size)
  size.times do |index|
    dest_array[dest_index + index] = source_array[source_index + index]
  end
end

p merge_sort([1, 3, 9, 11], [2, 4, 6, 8])
# => [1, 2, 3, 4, 6, 8, 9, 11]
