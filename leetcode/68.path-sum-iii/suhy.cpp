/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */
class Solution {
public:
    int helper(TreeNode* root, int sum) {
        if (root == NULL) {
            return 0;
        }
        int count = 0;
        if (root->val == sum) {
            count++;
        }
        int nextSum = sum - root->val;
        return count + helper(root->left, nextSum) + helper(root->right, nextSum);
    }
    
    int pathSum(TreeNode* root, int sum) {
        if (root == NULL) {
            return 0;
        }
        return helper(root, sum) + pathSum(root->left, sum) + pathSum(root->right, sum);
    }
};
