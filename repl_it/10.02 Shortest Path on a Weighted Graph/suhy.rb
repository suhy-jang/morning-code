def shortest_path_wg(matrix)
  q = [0]
  distances = Array.new(matrix.size, -1)
  distances[0] = 0
  until q.empty? do
    node = q.shift
    node_distance = distances[node]
    matrix[node].each_with_index do |distance, neighbor|
      next if distance.zero?
      if -1 != distances[neighbor]
        distances[neighbor] = [distances[neighbor], node_distance + distance].min
      else # if -1 == distances[neighbor]
        distances[neighbor] = node_distance + distance
        q.push(neighbor)
      end
    end
  end
  distances  
end

p shortest_path_wg([[0, 0, 1, 3, 0, 0], [0, 0, 0, 5, 0, 0], [1, 0, 0, 2, 1, 4], [3, 5, 2, 0, 7, 0], [0, 0, 1, 7, 0, 2], [0, 0, 4, 0, 2, 0]])
# => [0, 8, 1, 3, 2, 4]
