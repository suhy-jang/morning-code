def index_match(array)
    result = -1
    array.each_with_index {|ar, index| result = ar if ar == index}
    puts result
end

puts index_match([0, 2, 3, 7, 9, 11])
# => 0

def binary_search(array, low, high)
    return -1 if low > high
    middle = (low + high) / 2
    el = array[middle]
    return el if el == middle
    return binary_search(array, low, middle-1) if el > middle
    return binary_search(array, middle+1, high) if el < middle
end
def index_match(array)
    low = 0
    high = array.size - 1
    return binary_search(array, low, high)
end
puts index_match([0, 2, 3, 7, 9, 11])