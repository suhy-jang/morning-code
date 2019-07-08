def index_match(array)
    result = -1
    array.each_with_index {|ar, index| result = ar if ar == index}
    puts result
end

puts index_match([0, 2, 3, 7, 9, 11])
# => 0