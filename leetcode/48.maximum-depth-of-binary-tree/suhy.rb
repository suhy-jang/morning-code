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
def max_depth(root)
    return 0 if root.nil?
    get_max_depth(root, 1)
end

def get_max_depth(root, depth)
    return depth-1 if root.nil?
    [get_max_depth(root.left, depth+1) , get_max_depth(root.right, depth+1)].max
end
