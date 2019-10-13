# @param {Character[][]} matrix
# @return {Integer}
def maximal_square(matrix)
    max_val = 0
    return 0 if matrix.size.zero?
    matrix.each_with_index do |line, i|
        line.each_with_index do |elem, j|
            next if elem == '0'
            max_val = [max_val, get_count(matrix, i, j, 1, 1)].max
        end
    end
    max_val
end

def get_count(matrix, i, j, add, count)
    return count if i+add >= matrix.size || j+add >= matrix[0].size
    0.upto(add) do |di|
        return count if matrix[i+di][j+add] == '0'
    end
    0.upto(add-1) do |dj|
        return count if matrix[i+add][j+dj] == '0'
    end
    add += 1
    count = add * add
    get_count(matrix, i, j, add, count)
end

# [["0","0","0","1"],["1","1","0","1"],["1","1","1","1"],["0","1","1","1"],["0","1","1","1"]]
# => 9
