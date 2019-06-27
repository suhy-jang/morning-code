def full_counting_sort(array)
  counts = get_counts(array)
  counts = get_stacked_counts(counts)
  get_count_sort(array, counts)
end

def get_counts(array)
  array.each_with_object(Array.new(array.size, 0)) { |element,results| results[element.to_i] += 1 }
end

def get_stacked_counts(array)
  array.each_index.map { |idx| array[idx] += array[idx-1] }
end

def get_count_sort(array, counts)
  results = Array.new(counts.last - 1, 0)
  array.reverse_each do |element|
    number = element.to_i
    word = element.split[1]
    index = counts[number] - 1
    results[index] = word
    counts[number] -= 1
  end
  results
end

p full_counting_sort(["0 ab", "6 cd", "0 ef", "6 gh", "4 ij", "0 ab", "6 cd", "0 ef", "6 gh", "0 ij", "4 that", "3 be", "0 to", "1 be", "5 question", "1 or", "2 not", "4 is", "2 to", "4 the"])
# => ["ab", "ef", "ab", "ef", "ij", "to", "be", "or", "not", "to", "be", "ij", "that", "is", "the", "question", "cd", "gh", "cd", "gh"]
