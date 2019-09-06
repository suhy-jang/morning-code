def full_merge_sort(array)
  merge_sort(array, 0, array.size - 1)
  array.divide_only_word
end

def merge_sort(array, leftStart, rightEnd)
  return array if leftStart >= rightEnd
  mid = (leftStart + rightEnd) / 2
  merge_sort(array, leftStart, mid)
  merge_sort(array, mid + 1, rightEnd)
  combine(array, leftStart, rightEnd)
end

def combine(array, leftStart, rightEnd)
  mid = (leftStart + rightEnd) / 2
  leftEnd = mid
  rightStart = mid + 1
  left = leftStart
  right = rightStart
  temp = Array.new(array.size, nil)
  index = leftStart
  until left > leftEnd || right > rightEnd do
    if array[left].to_i <= array[right].to_i
      temp[index] = array[left]
      left += 1
    else
      temp[index] = array[right]
      right += 1
    end
    index += 1
  end
  temp.copy(index, array, left, (leftEnd - left + 1))
  temp.copy(index, array, right, (rightEnd - right + 1))
  array.copy(leftStart, temp, leftStart, (rightEnd - leftStart + 1))
end

class Array
  def copy(dest_index, source, source_index, size)
    size.times do |index|
      self[dest_index + index] = source[source_index + index]
    end
    self
  end
  
  def divide_only_word
    map { |words| words.split(' ').last }
  end
end

full_merge_sort(["0 ab", "6 cd", "0 ef", "6 gh", "4 ij", "0 ab", "6 cd", "0 ef", "6 gh", "0 ij", "4 that", "3 be", "0 to", "1 be", "5 question", "1 or", "2 not", "4 is", "2 to", "4 the"])
# => ["ab", "ef", "ab", "ef", "ij", "to", "be", "or", "not", "to", "be", "ij", "that", "is", "the", "question", "cd", "gh", "cd", "gh"]
