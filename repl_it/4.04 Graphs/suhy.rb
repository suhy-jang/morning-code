def graph(hash_graph)
  arr = [0]
  next_node = 0
  until 4==next_node do
    next_node = hash_graph[next_node][0]
    arr << next_node
  end
  arr
end

hash = { 
  0 => [2], 
  1 => [4], 
  2 => [5, 0, 3], 
  3 => [2], 
  4 => [1, 5], 
  5 => [4, 2]
}

p graph(hash)
# => [0, 2, 5, 4]

