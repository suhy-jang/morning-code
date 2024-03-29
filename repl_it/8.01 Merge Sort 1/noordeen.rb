def merge_sort(array1, array2)
  # write your code here
  sorted = []
  until array1.empty? || array2.empty?
    if array1.first <= array2.first
      sorted << array1.shift
    else
      sorted << array2.shift
    end
  end
  sorted.concat(array1).concat(array2)
end

p merge_sort([1, 3, 9, 11], [2, 4, 6, 8])
# => [1, 2, 3, 4, 6, 8, 9, 11]
