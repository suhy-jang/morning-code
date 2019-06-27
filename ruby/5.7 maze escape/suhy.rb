
def recursive_get(arr, x, y)
  return [[0, 0]] if x == 0 && y == 0
  past_num = arr[x][y]
  curr_idx = [[-1, -1]]

  if (x-1)>=0 && arr[x-1][y] != 0 && arr[x-1][y] == (past_num - 1)
    curr_idx = recursive_get(arr, x-1, y)
  elsif (x+1)<arr.length && arr[x+1][y] != 0 && arr[x+1][y] == (past_num - 1)
    curr_idx = recursive_get(arr, x+1, y)
  elsif (y-1)>=0 && arr[x][y-1] != 0 && arr[x][y-1] == (past_num - 1)
    curr_idx = recursive_get(arr, x, y-1)
  elsif (y+1)>=0 && arr[x][y+1] != 0 && arr[x][y+1] == (past_num - 1)
    curr_idx = recursive_get(arr, x, y+1)
  end

  curr_idx += [[y, x]]
  return curr_idx
end

def maze_escape(maze)
  record = maze.map { |row| row.map { |elem| 0 } }
  queue = [[0,0]]
  record[0][0] = 1
  x, y = 0, 0
  until queue.empty? do
    curr = queue.shift
    x = curr[0]
    y = curr[1]
    num = record[x][y]
    break if maze[x][y] == 9
    if (x-1)>=0 && maze[x-1][y] != 1 && record[x-1][y] == 0
      record[x-1][y] = num + 1
      queue << [x-1,y]
    end
    if (x+1)<maze.length && maze[x+1][y] != 1 && record[x+1][y] == 0
      record[x+1][y] = num + 1
      queue << [x+1,y]
    end
    if (y-1)>=0 && maze[x][y-1] != 1 && record[x][y-1] == 0
      record[x][y-1] = num + 1
      queue << [x,y-1]
    end
    if (y+1)<maze[0].length && maze[x][y+1] != 1 && record[x][y+1] == 0
      record[x][y+1] = num + 1
      queue << [x,y+1]
    end
  end
  #record.each {|p| print p; print "\n" }
  recursive_get(record,x,y)
end

p maze_escape(
  [
    [0, 0, 0, 0, 0], 
    [0, 1, 0, 1, 0], 
    [0, 1, 0, 1, 1], 
    [0, 1, 0, 0, 0], 
    [0, 0, 0, 1, 9]
  ]
)
# => [ 
#      [0, 0],
#      [1, 0],
#      [2, 0],
#      [2, 1],
#      [2, 2],
#      [2, 3],
#      [3, 3],
#      [4, 3],
#      [4, 4]
#    ]
