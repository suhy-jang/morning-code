/**
 * @param {number[][]} matrix
 * @param {number} target
 * @return {boolean}
 */
const binary = (matrix, target) => {
    const searchHelper = (left, top, right, bottom) => {
        if (left > right || top > bottom) return false;
        if (target < matrix[top][left] || target > matrix[bottom][right]) return false;
        
        const mid = left + Math.floor((right - left) / 2);
        let row = top;
        while (bottom >= row && matrix[row][mid] <= target) {
            if (matrix[row][mid] == target) {
                return true;
            }
            row += 1
        }
        return searchHelper(left, row, mid-1, bottom) || searchHelper(mid+1, top, right, row-1)
    }
    const searchMatrix = () => {
        if (matrix.length === 0) return false;
        return searchHelper(0, 0, matrix[0].length-1, matrix.length-1)
    }
    return {
        searchMatrix
    };
};
const searchMatrix = (matrix, target) => {
    return binary(matrix, target).searchMatrix();    
};
