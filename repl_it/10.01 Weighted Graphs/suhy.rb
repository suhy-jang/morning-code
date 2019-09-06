def weighted_graphs(matrix)
  size = matrix.size
  min_routes = Array.new(size)
  min_routes[0] = 0
  visited = Array.new(size, 0)
  counts = Array.new(size, 0)
  q = [0]
  until q.empty? do
    x_i = q.shift
    visited[x_i] = 1
    min_routes[x_i]
    0.upto(size-1) do |y_i|
      next if x_i == y_i || matrix[x_i][y_i].zero?
      q << y_i if visited[y_i].zero?
      update_minimum(min_routes, matrix, counts, x_i, y_i)
    end
  end
  counts
end

def update_minimum(routes, matrix, counts, prev_i, curr_i)
  add_route = routes[prev_i] || 0
  add_route += matrix[prev_i][curr_i]
  if routes[curr_i].nil? || routes[curr_i] > add_route
    routes[curr_i] = add_route
    if counts[curr_i].zero?
      counts[curr_i] = counts[prev_i] + 1 
    else
      counts[curr_i] = [counts[prev_i] + 1, counts[curr_i]].min
    end
  end
  nil
end

p weighted_graphs([[0, 0, 1, 3, 0, 0], [0, 0, 0, 5, 0, 0], [1, 0, 0, 2, 1, 4], [3, 5, 2, 0, 7, 0], [0, 0, 1, 7, 0, 2], [0, 0, 4, 0, 2, 0]])
# => [0, 2, 1, 1, 2, 2]
