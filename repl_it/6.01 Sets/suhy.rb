require 'set'

def find_duplicates(array)
  # write your code here
  duplicates = []
  set = array.to_set
  array.each do |elem|
    if set.include? elem
      set.delete(elem)
    else
      duplicates << elem
    end
  end
  duplicates
end

p find_duplicates([1, 2, 3, 1, 5, 6, 7, 8, 5, 2, 1, 1])
# => [1, 5, 2]

p find_duplicates([3, 501, 17, 23, -43, 67, 5, 888, -402, 235, 77, 99, 311, 1, -43])
# => [-43]

