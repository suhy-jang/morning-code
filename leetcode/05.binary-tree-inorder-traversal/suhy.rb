# https://leetcode.com/problems/binary-tree-inorder-traversal

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[]}
def inorder_traversal(root)
    return [] if root.nil?
    collections = Array.new
    visits = Array.new
    curr = root
    until curr.nil? && visits.empty?
        if curr
            visits << curr
            curr = curr.left
        else
            curr = visits.pop
            collections << curr.val
            curr = curr.right
        end
    end
    collections
end

print inorder_traversal([1,null,2,3])
