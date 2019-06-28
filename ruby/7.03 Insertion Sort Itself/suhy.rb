def sort_itself(array)
  0.upto(array.length-1) do |i|
    next if i.zero?
    temp = array[i]
    j = i
    until j-1<0 || sorted(array[j-1], temp) do
      array = insert(array, j, j-1)
      j-=1
    end
    array[j] = temp 
    print_elements(array)
  end
end

def print_elements(arr)
  print arr.join(" "), "\n"
end

def insert(arr, id, is)
  arr[id] = arr[is]
  arr
end

def sorted(a,b)
  a <=b
end

sort_itself([1, 4, 3, 6, 9, 2])
# => 1 4 3 6 9 2
#    1 3 4 6 9 2
#    1 3 4 6 9 2
#    1 3 4 6 9 2
#    1 2 3 4 6 9
