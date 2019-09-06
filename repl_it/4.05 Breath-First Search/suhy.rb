def bfs(graph)
  result = []
  q = []
  q << 0
  until q.empty? do
    breath_size = q.size()
    for i in 0...breath_size do
      n = q.shift
      result << n unless result.include?(n)
      for j in 0...graph[n].size() do
        q << graph[n][j] unless result.include?(graph[n][j])
      end
    end
  end
  result
end

p bfs({
  0 => [2], 
  1 => [4], 
  2 => [5, 0, 3], 
  3 => [2], 
  4 => [1, 5], 
  5 => [4, 2]
})
# => [0, 2, 5, 3, 4, 1]
