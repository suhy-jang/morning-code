# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
    return 0 if grid.nil? || grid.length == 0
    
    num_islands = 0
    nr = grid.length
    nc = grid[0].length
    
    0.upto(nr-1) do |r|
        0.upto(nc-1) do |c|
            next if grid[r][c] == '0'
            num_islands += 1
            neighbors = []
            print [r, c]
            neighbors.push([r, c])
            grid[r][c] = '0'
            until neighbors.empty?
                arr = neighbors.shift
                row, col = arr[0], arr[1]
                if row-1 >= 0 && grid[row-1][col] == '1'
                    neighbors.push([row-1, col])
                    grid[row-1][col] = '0'
                end
                if row+1 < nr && grid[row+1][col] == '1'
                    neighbors.push([row+1, col])
                    grid[row+1][col] = '0'
                end
                if col-1 >= 0 && grid[row][col-1] == '1'
                    neighbors.push([row, col-1])
                    grid[row][col-1] = '0'
                end
                if col+1 < nc && grid[row][col+1] == '1'
                    neighbors.push([row, col+1])
                    grid[row][col+1] = '0'
                end
            end
        end
    end
    num_islands
end
