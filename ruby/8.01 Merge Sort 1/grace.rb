def merge(array)
    return array if array.length == 1
    middle_point = array.length / 2
    merge merge(array[0...middle_point]), merge(array[middle_point..-1])
end
def merge_sort(array1, array2)
    result = []
    until array1.length == 0 || array2.length == 0 do
        result << (array1.first <= array2.first ? array1.shift : array2.shift)
    end
    result + array1 + array2
end

p merge_sort([1, 3, 9, 11], [2, 4, 6, 8])
# => [1, 2, 3, 4, 6, 8, 9, 11]
