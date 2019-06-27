def insertion_sort(array)
  0.upto(array.length-1) do |i|
    next if i.zero?
    temp = array[i]
    j = i
    until j-1<0 || sorted(array[j-1], temp) do
      array = insert(array, j-1, j)
      j-=1
      print_elements(array)
    end
    unless j==i
      array[j] = temp 
      print_elements(array)
    end
  end
end

def print_elements(arr)
  print arr.join(" "), "\n"
end

def insert(arr, is, id)
  arr[id] = arr[is]
  arr
end

def swap(arr,ia,ib)
  arr[ia],arr[ib] = arr[ib],arr[ia]
  arr
end

def sorted(a,b)
  a <=b
end

insertion_sort([1, 4, 6, 9, 3])

insertion_sort([1, 3, 2])
# => 1 3 3
#    1 2 3

puts '-' * 20

insertion_sort([1, 4, 6, 9, 3])
# => 1 4 6 9 9
#    1 4 6 6 9
#    1 4 4 6 9
#    1 3 4 6 9
