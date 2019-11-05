/**
 * Definition for a binary tree node.
 * function TreeNode(val) {
 *     this.val = val;
 *     this.left = this.right = null;
 * }
 */
/**
 * @param {TreeNode} root
 * @param {number} sum
 * @return {number}
 */
const helper = (root, sum) => {
    if (root === null) {
        return 0;
    }
    let count = 0;
    if (root.val === sum) {
        count += 1;
    }
    let nextSum = sum - root.val;
    return count + helper(root.left, nextSum) + helper(root.right, nextSum);
}

const pathSum = (root, sum) => {
    if (root === null) {
        return 0;
    }
    return helper(root, sum) + pathSum(root.left, sum) + pathSum(root.right, sum);
};
