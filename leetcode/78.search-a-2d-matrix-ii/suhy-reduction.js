/**
 * @param {number[][]} matrix
 * @param {number} target
 * @return {boolean}
 */
const searchMatrix = (matrix, target) => {
    let row = matrix.length - 1
    let col = 0
    while (row >= 0 && col < matrix[0].length) {
        if (matrix[row][col] === target) {
            return true;
        } else if (matrix[row][col] < target) {
            col += 1;
        } else {
            row -= 1;
        }
    }
    return false;
    
};
