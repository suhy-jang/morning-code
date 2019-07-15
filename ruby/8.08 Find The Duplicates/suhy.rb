def duplicates(arr1, arr2)
  number_list = Hash.new(0)
  arr1.each do |number|
    number_list[number] -= 1
  end
  
  arr2.each do |number|
    number_list[number] += 1
  end
  
  get_positive_lists(number_list).sort
end

def get_positive_lists(counts)
  counts.each_with_object(Array.new) do |count, arr|
    arr << count[0] if(count[1]>0)
  end
end

p duplicates([203, 204, 205, 206, 207, 208, 203, 204, 205, 206], [203, 204, 204, 205, 206, 207, 205, 208, 203, 206, 204, 205, 206])
# => [204, 205, 206]
