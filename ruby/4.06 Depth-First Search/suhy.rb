
def DFS_helper(graph, idx, result)
  result << idx unless result.include?(idx)
  for next_idx in graph[idx]
    DFS_helper(graph,next_idx,result) unless result.include?(next_idx)
  end
  return result
end

def depth_first_search(graph)
  return nil if graph.nil?
  DFS_helper(graph,0,[])
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
