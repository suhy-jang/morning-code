# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor(root, p, q)
    return nil if root.nil?
    lca = []
    lca << ((root == p || root == q) ? root : nil)
    lca << lowest_common_ancestor(root.left, p, q)
    lca << lowest_common_ancestor(root.right, p, q)
    return root if (!!lca[0] && (lca[1] || lca[2])) || (!!lca[1] && !!lca[2])
    return root if (!!lca[0] && !lca[1] && !lca[2])
    return lca[1] || lca[2]
end
