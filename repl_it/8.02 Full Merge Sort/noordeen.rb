def full_merge_sort(array)
  # write your code here
  hashes = Hash.new
  array.each{|ele| 
    temp_arr = []
    arr = ele.split(' ')
    temp_arr << hashes[arr[0].to_i] if !(hashes[arr[0].to_i].nil?)
    temp_arr << arr[1]
    hashes[arr[0].to_i] = temp_arr.flatten
  }
  new_arry = mergesort(hashes.keys)
  result = []
  new_arry.each{|x|
    result << hashes[x]
  }
  result.flatten
end
def mergesort(list)
  return list if list.size <= 1
  mid   = list.size / 2
  left  = list[0...mid]
  right = list[mid...list.size]
  merge(mergesort(left), mergesort(right))
end

def merge(left, right)
  sorted = []
  until left.empty? || right.empty?
    if left.first <= right.first
      sorted << left.shift
    else
      sorted << right.shift
    end
  end
  sorted.concat(left).concat(right)
end


full_merge_sort(["0 ab", "6 cd", "0 ef", "6 gh", "4 ij", "0 ab", "6 cd", "0 ef", "6 gh", "0 ij", "4 that", "3 be", "0 to", "1 be", "5 question", "1 or", "2 not", "4 is", "2 to", "4 the"])
# => ["ab", "ef", "ab", "ef", "ij", "to", "be", "or", "not", "to", "be", "ij", "that", "is", "the", "question", "cd", "gh", "cd", "gh"]
