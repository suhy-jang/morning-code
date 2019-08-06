# https://leetcode.com/problems/binary-tree-maximum-path-sum
# https://www.youtube.com/watch?v=cSnETAcziS0

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

$max = nil

def max_path_sum(root)
  root = array_to_tree(root, 0) # customizing for test
  $max = root.val unless root.nil?
  max_path_sum_helper(root)
  $max
end

def max_path_sum_helper(root)
  return 0 if root.nil?
  val = root.val
  l = max_path_sum_helper(root.left)
  r = max_path_sum_helper(root.right)
  max_single = [[l,r].max + val, val].max
  max_top = [max_single, l+r+val].max
  $max = [$max, max_top].max
  max_single
end

# customizing for test

class Node
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

def array_to_tree(array, index)
  return nil if index >= array.size || array[index].nil?
  node = Node.new(array[index])
  node.left = array_to_tree(array, index*2 + 1)
  node.right = array_to_tree(array, index*2 + 2)
  return node
end

print max_path_sum([1,2,3]),      "#=>6\n"
print max_path_sum([1,-2,3]),     "#=>4\n"
print max_path_sum([-2,-1]),      "#=>-1\n"

# customizing for test /
