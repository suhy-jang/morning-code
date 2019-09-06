
def index_match(array)
  binary_search(array, 0, array.size - 1)
end

def binary_search(array, leftStart, rightEnd)
  return -1 if leftStart > rightEnd
  
  mid = (leftStart + rightEnd) / 2
  if mid == array[mid]
    mid
  elsif mid < array[mid]
    binary_search(array, leftStart, mid - 1)
  else
    binary_search(array, mid + 1, rightEnd)
  end
end

puts index_match([0, 2, 3, 7, 9, 11])
# => 0
