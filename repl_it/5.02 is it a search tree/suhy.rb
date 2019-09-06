class Node
  attr_accessor :val, :left, :right
  def initialize(val, left=nil, right=nil)
    @val = val
    @left = left
    @right = right
  end
end

def array_to_tree(arr, idx)
  if idx >= arr.length
    return nil
  end
  node = Node.new(arr[idx])
  node.left = array_to_tree(arr, idx*2+1)
  node.right = array_to_tree(arr, idx*2+2)
  return node
end

def isBST?(root, min, max)
  return true if root.nil? || 0 == root.val
  return false if root.val < min || root.val > max
  currVal = root.val
  bT = true
  bT &= isBST?(root.left, min, currVal) if root.left != 0
  bT &= isBST?(root.right, currVal, max) if root.right !=0
  bT
end

def search_tree?(arr)
  root = array_to_tree(arr,0)
  isBST?(root, arr.min, arr.max)
end

puts search_tree?([10, 4, 12])
# => true

puts search_tree?([10, 5, 7])
# => false

puts search_tree?([21, 11, 26, 5, 14, 23, 30, 2, 8, 13, 16, 0, 0, 0, 0])
# => true
