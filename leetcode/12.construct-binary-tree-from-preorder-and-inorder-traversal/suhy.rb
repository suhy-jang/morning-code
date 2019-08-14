# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}
def build_tree(preorder, inorder)
    build_tree_h(0, 0, inorder.size-1, preorder, inorder)     
end

def build_tree_h(pre_start, in_start, in_end, preorder, inorder)
    return nil if pre_start > preorder.size || in_start > in_end
    root = TreeNode.new(preorder[pre_start])
    mid = in_start
    until mid > in_end || root.val == inorder[mid]
        mid += 1
    end
    root.left = build_tree_h(pre_start+1, in_start, mid-1, preorder, inorder)
    root.right = build_tree_h(pre_start + mid - in_start + 1, mid+1, in_end, preorder, inorder)
    root
end

# input [3,9,20,15,7]
#       [9,3,15,20,7]
# output [3,9,20,null,null,15,7] (tree form)
