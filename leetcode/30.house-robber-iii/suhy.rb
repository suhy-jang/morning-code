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
$memo = nil
def rob(root)
    return 0 if root.nil?
    $memo = Hash.new(0)
    rob_recursive(root)
end

def rob_recursive(root)
    return 0 if root.nil?
    return $memo[root] unless $memo[root].zero?
    value = root.val
    value += rob_recursive(root.left.left) + rob_recursive(root.left.right) if root.left
    value += rob_recursive(root.right.left) + rob_recursive(root.right.right) if root.right
    $memo[root] = [value, rob_recursive(root.left) + rob_recursive(root.right)].max
end
