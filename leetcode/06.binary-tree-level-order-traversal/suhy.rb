# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[][]}
def level_order(root)
    return [] if root.nil?
    i=0
    q = [root]
    orders = Array.new
    level = 1
    limit = 1
    until q.empty? do
        collections = Array.new
        next_limit = 0
        (0...limit).each do |add|
            break if q.empty?
            node = q.shift
            collections << node.val
            if node.left
                q << node.left
                next_limit += 1
            end
            if node.right
                q << node.right 
                next_limit += 1
            end
        end
        orders << collections unless collections.empty?
        limit = next_limit
        level += 1
    end
    return orders
end

# input : TreeNode [1,2,null,3,null,4,null,5] output : [[1],[2],[3],[4],[5]]
