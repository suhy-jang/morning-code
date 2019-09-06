
def making_connection(hash, key)
  result = [key]
  stack = [key]
  until stack.length == 0
    next_key = stack.pop
    arr = hash[next_key]
    arr.each do |p|
      unless result.include? p
        result << p
        stack << p
      end
    end
  end
  result
end

def connected_graph?(graph)
  result = making_connection(graph,0)
  graph.length == result.length
end

puts connected_graph?({
  0 => [2], 
  1 => [4], 
  2 => [0, 5, 3], 
  3 => [5, 2], 
  4 => [5, 1], 
  5 => [4, 2, 3]
})
# => true
=begin
puts connected_graph?({
  0 => [1, 2], 
  1 => [0, 2], 
  2 => [0, 1, 3, 4, 5], 
  3 => [2, 4], 
  4 => [3, 2], 
  5 => [2]
})
# => true

=end
