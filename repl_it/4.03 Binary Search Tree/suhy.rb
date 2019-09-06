class Node
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
  end
end

def array_to_tree(array, i)
  return nil if i >= array.length || array[i] == 0

  node = Node.new(array[i])
  node.left = array_to_tree(array, 2*i+1)
  node.right = array_to_tree(array, 2*i+2)

  node
end

def pre_order(node)
  if node == nil
    return ''
  end

  result = "#{node.data} "
  result += pre_order(node.left)
  result += pre_order(node.right)
end

def post_order(node)
  if nil == node
    return ''
  end
  result = post_order(node.left)
  result += post_order(node.right)
  result+="#{node.data} "
  return result
end

def build_BST(root,node)
  return nil if nil == root
  
  if(root.data > node.data)
    if nil != root.left
      build_BST(root.left,node)
    else
      root.left = node
    end
  else #if(root<=node)
    if nil != root.right
      build_BST(root.right,node)
    else
      root.right = node
    end
  end
end


def binary_search_tree(array)
  root = Node.new(array[0])
  array.each_with_index do |n, i|
    node = Node.new(n)
    if 0==i
      root=node
      next
    end
    build_BST(root,node)
  end
  str = pre_order(root)
  str.strip
end

puts binary_search_tree([8, 3, 10, 1, 6, 14, 4, 7, 13])
puts binary_search_tree([5, 3, 7, 1, 2, 6, 8])
# => "8 3 1 6 4 7 10 14 13"

