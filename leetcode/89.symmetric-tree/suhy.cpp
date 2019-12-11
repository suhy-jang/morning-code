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
    bool isSymmetric(TreeNode* root) {
        if (root == NULL) return true;
        
        TreeNode* temp = root->left;
        symmetric(temp);
        return isEqual(temp, root->right);
    }
    
    bool isEqual(TreeNode* a, TreeNode* b) {
        if (a == NULL && b == NULL) return true;
        if (a == NULL ^ b == NULL) return false;
        return (a->val == b->val) && isEqual(a->left, b->left) && isEqual(a->right, b->right);
    }
    
    void symmetric(TreeNode* root) {
        if (root == NULL) return;
        
        TreeNode* temp = root->left;
        root->left = root->right;
        root->right = temp;
        symmetric(root->left);
        symmetric(root->right);
    }
};
