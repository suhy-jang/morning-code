# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
class SpaceReduction
    def initialize(matrix, target)
        @matrix = matrix
        @target = target
    end
    
    def search_matrix
        row = @matrix.length - 1
        col = 0
        while row >= 0 && col < @matrix[0].length
            if @matrix[row][col] == @target
                return true
            elsif @matrix[row][col] < @target
                col += 1
            elsif @matrix[row][col] > @target
                row -= 1
            end
        end
        return false
    end
end

def search_matrix(matrix, target)
    SpaceReduction.new(matrix, target).search_matrix
end
