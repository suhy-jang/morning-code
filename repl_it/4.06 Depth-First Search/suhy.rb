def DFS_helper(graph, idx, visited)
  return [] if visited[idx]

  results = [idx]
  visited[idx] = true
  for next_idx in graph[idx]
    results.concat(DFS_helper(graph,next_idx,visited))
  end
  return results
end

def depth_first_search(graph)
  return nil if graph.nil?
  
  DFS_helper(graph, 0, create_false_array(graph))
end

def create_false_array(array)
  Array.new(array.length, false)
end

p depth_first_search({
  0 => [2],
  1 => [4],
  2 => [5, 0, 3],
  3 => [2],
  4 => [1, 5],
  5 => [4, 2]
})
# => [0, 2, 5, 4, 1, 3]
