/**
 * @param {number[][]} grid
 * @return {number}
 */
var minPathSum = function(grid) {
    const rLength = grid.length;
    const cLength = grid[0].length;
    const minGrid = new Array(rLength).fill(new Array(cLength).fill(0));
    for(let r=0; r<rLength; r++) {
        for(let c=0; c<cLength; c++) {
            if (r-1 >= 0) {
                minGrid[r][c] = minGrid[r-1][c];
            }
            if (c-1 >= 0 && (minGrid[r][c] === 0 || minGrid[r][c] > minGrid[r][c-1])) {
                minGrid[r][c] = minGrid[r][c-1];
            }
            minGrid[r][c] += grid[r][c];
        }
    }
    return minGrid[rLength-1][cLength-1];
};
