/**
 * @param {number[][]} matrix
 * @return {void} Do not return anything, modify matrix in-place instead.
 */
const rotate = (matrix) => {
    const n = matrix.length
    for(let r = 0; r < Math.floor((n + 1) / 2); r++) {
        for(let c = 0; c < Math.floor(n / 2); c++) {
            let temp = matrix[n - 1 - c][r];
            matrix[n-1-c][r] = matrix[n-1-r][n-1-c];
            matrix[n-1-r][n-1-c] = matrix[c][n-1-r];
            matrix[c][n-1-r] = matrix[r][c];
            matrix[r][c] = temp
        }
    }
};

