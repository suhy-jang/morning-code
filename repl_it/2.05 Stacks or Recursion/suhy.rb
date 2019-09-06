def tree_height(tree_as_list)
  height = 0
  if tree_as_list.empty?
    return 0
  else
    height += 1
  end
  exp = 2**(height-1)
  i = 0
  tree_as_list.each do
    |number|
    if i < exp
      i += 1
      next
    end
    exp = 2**height
    height += 1
    i=0
  end
  return height
end

puts tree_height([2, 7, 5, 2, 6, 0, 9])
# => 3


puts tree_height([1, 7, 5, 2, 6, 0, 9, 3, 7, 5, 11, 0, 0, 4, 0])
# => 4


puts tree_height([5, 3, 2, 9, 0, 0, 7, 0, 0, 0, 0, 0, 0, 5, 0])
# => 4
