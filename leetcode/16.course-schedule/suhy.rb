# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Boolean}
def can_finish(num_courses, prerequisites)
    graph = Array.new{ Array.new }
    visited = Array.new(num_courses)
    prerequisites.each do |pair|
        while graph.size <= pair[1]
            inner = Array.new
            graph << inner
        end
        graph[pair[1]] << pair[0]
    end
    (0...num_courses).each do |i|
        return false unless dfs(graph, visited, i)
    end
    return true
end

def dfs(graph, visited, i)
    return false if visited[i] == -1
    return true if visited[i] == 1
    if graph.size <= i
        visited[i] = 1
        return true
    end
    visited[i] = -1
    graph[i].each do |index|
        return false unless dfs(graph, visited, index)
    end
    visited[i] = 1
    true
end
