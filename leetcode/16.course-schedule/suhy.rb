# https://leetcode.com/problems/course-schedule/
# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Boolean}
def can_finish(num_courses, prerequisites)
    graph = Array.new { Array.new }
    visited = Array.new(num_courses)
    prerequisites.each do |pair|
        if graph.size <= pair[1]
            add = Array.new(pair[1] - graph.size + 1) { Array.new }
            graph += add
        end
        graph[pair[1]] << pair[0]
    end
    (0...num_courses).each do |i|
        return false unless dfs(graph, visited, i)
    end
    true
end        

def dfs(graph, visited, i)
    return false if visited[i] == -1
    return true if visited[i] == 1
    if graph.size <= i
        visited[i] = true
        return true
    end
    visited[i] = -1
    graph[i].each do |connect|
        return false unless dfs(graph, visited, connect)
    end
    visited[i] = 1
    true
end

# input : 2
#         [[1,0],[0,1]]
# output : false
