def partition(array)
    # write your code here
    pivot = array[0]
    pivot_location = 0
    i = 1
    while i < array.size
        recu = array[i]
        if recu < pivot
            j = i
            while j > pivot_location
                array[j] = array[j-1]
                j -= 1
            end
            array[pivot_location] = recu
            pivot_location += 1
        end
        i += 1
    end
    return array
  end
  
  p partition([4, 5, 3, 9, 1])
  # => [3, 1, 4, 5, 9]