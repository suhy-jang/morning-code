/**
 * Definition for a binary tree node.
 * function TreeNode(val) {
 *     this.val = val;
 *     this.left = this.right = null;
 * }
 */
/**
 * @param {TreeNode} t1
 * @param {TreeNode} t2
 * @return {TreeNode}
 */

var mergeTrees = function(t1, t2) {
    if (!t1 && !t2) {
        return null;
    }
    let root = null;
    if (t1 && t2) {
        const value = ((t1 && t2) ? (t1.val + t2.val) : (t1 ? t1.val : t2.val));
        root = new TreeNode(value);
        root.left = mergeTrees(t1.left, t2.left);
        root.right = mergeTrees(t1.right, t2.right);
    } else {
        root = t1 || t2;
    }
    return root;
};
