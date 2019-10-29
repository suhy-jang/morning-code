class Solution {
public:
    int numIslands(vector<vector<char>>& grid) {
        if(grid.size() == 0 || grid[0].size() == 0) return 0;
        
        int numIslands = 0;
        int nr = grid.size();
        int nc = grid[0].size();
        for(int r = 0; r < nr; r++) {
            for(int c = 0; c < nc; c++) {
                if(grid[r][c] == '0') continue;
                
                numIslands++;
                queue<pair<int, int>> neighbors;
                neighbors.push({ r, c });
                grid[r][c] = '0';
                while(!neighbors.empty()) {
                    pair<int, int> rc = neighbors.front();
                    neighbors.pop();
                    int row = rc.first;
                    int col = rc.second;
                    if((row-1) >= 0 && grid[row-1][col] == '1') {
                        grid[row-1][col] = '0';
                        neighbors.push({ row-1, col });
                    }
                    if((row+1) < nr && grid[row+1][col] == '1') {
                        grid[row+1][col] = '0';
                        neighbors.push({ row+1, col });
                    }
                    if((col-1) >= 0 && grid[row][col-1] == '1') {
                        grid[row][col-1] = '0';
                        neighbors.push({ row, col-1 });
                    }
                    if((col+1) < nc && grid[row][col+1] == '1') {
                        grid[row][col+1] = '0';
                        neighbors.push({ row, col+1 });
                    }
                }
            }
        }
        return numIslands;
    }
};
