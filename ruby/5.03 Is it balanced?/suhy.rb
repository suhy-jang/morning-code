class Node
  attr_accessor :left, :right, :value
  def initialize(value, right = nil, left = nil )
    @right = right
    @left = left
    @value = value
  end
end

def array_to_tree(arr, idx)
  return nil if idx >= arr.length
  tree = Node.new(arr[idx])
  tree.left = array_to_tree(arr, 2*idx+1)
  tree.right = array_to_tree(arr, 2*idx+2)
  return tree
end

def isBalanced(root)
  return true if balancedHeight(root) > -1
  false
end

def balancedHeight(root)
  return 0 if root == nil || root.value == 0
  h1 = balancedHeight(root.right)
  h2 = balancedHeight(root.left)
  return -1 if (h1 == -1 || h2 == -1)
  return -1 if (h1 - h2).abs > 1
  return h1 + 1 if h1 > h2
  return h2 + 1
end

def balanced_tree?(array)
  root = array_to_tree(array, 0)
  isBalanced(root)
end

puts balanced_tree?([1, 2, 0, 3, 4, 0, 0])

# => false

puts balanced_tree?([1, 2, 3, 4, 5, 6, 7])

# => false

