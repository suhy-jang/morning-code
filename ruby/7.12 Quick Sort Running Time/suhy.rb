def quicksort_running_time(array)
  get_insertion_running_time(array) - get_quicksort_running_time(array)
end

def get_quicksort_running_time(array)
  qs = QuickSort.new(array_copy(array))
  qs.quick_sort
  qs.count
end

def get_insertion_running_time(array)
  is = InsertionSort.new(array_copy(array))
  is.insertion_sort
  is.count
end

def array_copy(array)
  array.map{|e| e}
end

class QuickSort
  attr_reader :count

  def initialize(array)
    @array = array
    @count = 0
  end

  def quick_sort
    quick_sort_recursion(array, 0, array.length - 1)
  end

  def count
    @count
  end

  private

  def array
    @array
  end

  def quick_sort_recursion(array, i_start, i_end)
    return array if i_start >= i_end
    pivot = array[i_end]
    i_lg = i_start
    i_start.upto(i_end) do |index|
      if array[index] <= pivot
        array[index], array[i_lg] = array[i_lg], array[index]
        i_lg += 1
        @count += 1
      end
    end
    i_lg -= 1
    quick_sort_recursion(array, i_start, i_lg - 1)
    quick_sort_recursion(array, i_lg + 1, i_end)
    @count
  end
end

class InsertionSort
  attr_reader :count

  def initialize(array)
    @array = array
    @count = 0
  end

  def insertion_sort
    1.upto(array.length-1) do |index|
      last_one = array[index]
      mv_i = index
      until mv_i<=0 || array[mv_i - 1] <= last_one do
        array[mv_i] = array[mv_i - 1]
        @count += 1
        mv_i -= 1
      end
      array[mv_i] = last_one
    end
    @count
  end

  def count
    @count
  end

  private

  def array
    @array
  end
end

puts quicksort_running_time([1, 3, 9, 8, 2, 7, 5])
# => 1
