/**
 * @param {character[][]} grid
 * @return {number}
 */
let numIslands = (grid) => {
    if (grid === null || grid.length === 0) return 0;
    
    let numIslands = 0;
    const nr = grid.length;
    const nc = grid[0].length;
    for(let r=0; r < grid.length; r++) {
        for(let c=0; c < grid[0].length; c++) {
            if (grid[r][c] === '0') continue;
            
            numIslands += 1;
            const neighbors = new Array();
            neighbors.push([r, c]);
            while (neighbors.length != 0) {
                const rc = neighbors.pop();
                const row = rc[0];
                const col = rc[1];
                if ((row-1) >= 0 && grid[row-1][col] == '1') {
                    neighbors.push([row-1, col]);
                    grid[row-1][col] = '0';
                }
                if ((row+1) < nr && grid[row+1][col] == '1') {
                    neighbors.push([row+1, col]);
                    grid[row+1][col] = '0';
                }
                if ((col-1) >= 0 && grid[row][col-1] == '1') {
                    neighbors.push([row, col-1]);
                    grid[row][col-1] = '0';
                }
                if ((col+1) < nc && grid[row][col+1] == '1') {
                    neighbors.push([row, col+1]);
                    grid[row][col+1] = '0';
                }
            }
        }
    }
    return numIslands;
};
