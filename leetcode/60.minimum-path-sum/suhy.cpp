class Solution {
public:
    int minPathSum(vector<vector<int>>& grid) {
        int rSize = grid.size();
        int cSize = grid[0].size();
        vector<vector<int>> minPath(2, vector<int>(cSize, 0));
        for(int r=0; r < rSize; r++) {
            for(int c=0; c < cSize; c++) {
                if(r-1 >= 0) {
                    minPath[r%2][c] = minPath[(r+1)%2][c];
                }
                if(c-1 >= 0 && (minPath[r%2][c] == 0 || minPath[r%2][c] > minPath[r%2][c-1])) {
                    minPath[r%2][c] = minPath[r%2][c-1];
                }
                minPath[r%2][c] += grid[r][c];
            }
        }
        return minPath[(rSize+1)%2][cSize-1];
    }
};
