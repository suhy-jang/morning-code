# https://leetcode.com/problems/convert-bst-to-greater-tree/solution/

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {TreeNode}

def convert_bst(root)
    convert_bst_to_greater(root, [0])
end

def convert_bst_to_greater(root, sum)
    return nil if root.nil?
    convert_bst_to_greater(root.right, sum)
    sum[0] += root.val
    root.val = sum[0]
    convert_bst_to_greater(root.left, sum)
    return root
end

# input : TreeNode [5,2,13]
# output : TreeNode [18,20,13]
