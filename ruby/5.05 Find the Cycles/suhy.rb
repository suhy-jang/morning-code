
def graph_cycle?(graph)
  q = [0]
  visited = []
  until q.empty? do
    head = q.shift
    visited << head
    if neighbors = graph[head]
      not_visited = neighbors.reject { |neighbor| visited.include? neighbor }
      return true unless not_visited.size + 1 >= neighbors.size
      visited += not_visited
      q += not_visited
    end
  end
  false
end

puts graph_cycle?({
  0=>[2],
  1=>[4],
  2=>[0, 5, 3],
  3=>[5, 2],
  4=>[5, 1],
  5=>[4, 2, 3]
})
# => true

puts graph_cycle?({
  0=>[2],
  1=>[2],
  2=>[0, 1, 3, 4, 5],
  3=>[2],
  4=>[2]
})
# => false

puts graph_cycle?({0=>[2], 1=>[4, 3], 2=>[0, 5], 3=>[5, 1], 4=>[1], 5=>[2, 3]})
# => false

puts graph_cycle?({0=>[1, 2], 1=>[0, 2], 2=>[0, 1, 3, 4, 5], 3=>[2, 4], 4=>[3, 2], 5=>[2]})
# => true
