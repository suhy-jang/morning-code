/**
 * @param {number[][]} grid
 * @return {number}
 */
var minPathSum = function(grid) {
    const rLength = grid.length;
    const cLength = grid[0].length;
    const minGrid = new Array(2).fill(new Array(cLength).fill(0));
    for(let r=0; r<rLength; r++) {
        for(let c=0; c<cLength; c++) {
            if (r-1 >= 0) {
                minGrid[r%2][c] = minGrid[(r+1)%2][c];
            }
            if (c-1 >= 0 && (minGrid[r%2][c] === 0 || minGrid[r%2][c] > minGrid[r%2][c-1])) {
                minGrid[r%2][c] = minGrid[r%2][c-1];
            }
            minGrid[r%2][c] += grid[r][c];
        }
    }
    return minGrid[(rLength+1)%2][cLength-1];
};
