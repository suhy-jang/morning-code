class Node
  attr_reader :value
  attr_accessor :left, :right
  
  def initialize(val,left=nil,right=nil)
    @value=val
  end
end

def array_to_tree(array, idx)
  return nil if idx>=array.length || 0==array[idx]
  
  node = Node.new(array[idx])
  node.left = array_to_tree(array, 2*idx+1)
  node.right = array_to_tree(array, 2*idx+2)
  node
end

def binary_tree_height_helper(root)
  return 0 if root.nil?
  return 1 if nil == root.left && nil == root.right
  [binary_tree_height_helper(root.left), 
  binary_tree_height_helper(root.right)].max+1
end

def binary_tree_height(array_tree)
  root = array_to_tree(array_tree,0)
  binary_tree_height_helper(root)
end

puts binary_tree_height([2, 7, 5, 2, 6, 0, 9])
# => 3
