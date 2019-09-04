# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Void} Do not return anything, modify root in-place instead.
def flatten(root)
    return nil if root.nil?
    flatten(root.left)
    if root.left
        end_node = root.left
        while end_node.right
            end_node = end_node.right
        end
        next_node = root.right
        root.right = root.left
        root.left = nil
        end_node.right = next_node
    end
    flatten(root.right)
end
