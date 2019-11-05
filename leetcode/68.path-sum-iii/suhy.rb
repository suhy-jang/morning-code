# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Integer} sum
# @return {Integer}
def helper(root, sum)
    return 0 if root.nil?
    count = 0
    count += 1 if root.val == sum
    next_sum = sum - root.val
    count + helper(root.left, next_sum) + helper(root.right, next_sum)
end

def path_sum(root, sum)
    return 0 if root.nil?
    helper(root, sum) + path_sum(root.left, sum) + path_sum(root.right, sum)
end
