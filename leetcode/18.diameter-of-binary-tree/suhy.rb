# https://leetcode.com/problems/diameter-of-binary-tree/submissions/
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}
# just wondering I could improve using the memoization
def diameter_of_binary_tree(root)
    return 0 if root.nil?
    diameter_of_binary_tree_h(root, [0])
end

def diameter_of_binary_tree_h(root, max)
    return 0 if root.nil? || root.left.nil? && root.right.nil?
    curr = max_height(root.left) + max_height(root.right)
    diameter_of_binary_tree_h(root.left, max)
    diameter_of_binary_tree_h(root.right, max)
    max[0] = [max[0], curr].max
end

def max_height(root)
    return 0 if root.nil?
    left = max_height(root.left)
    right = max_height(root.right)
    return 1 + [left, right].max
end
