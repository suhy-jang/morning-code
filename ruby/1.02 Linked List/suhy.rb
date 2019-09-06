# Start with your code from last challenge.
class Node
  attr_accessor :value, :next_node
  
  def initialize(value, next_node = nil)
	  @value = value
    @next_node = next_node
  end
end

class LinkedList
  #setup head and tail
  def initialize()
    @head = nil
    @tail = nil
  end

  def add(number)
    # your code here
    node = Node.new(number)
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next_node = node
      @tail = node
    end
  end
  
  def get_node(index)
    node = @head
    i=0
    index.times do
      node = node.next_node
    end
    return node
  end
  
  def add_at(index, item)
    new_node = Node.new(item)
    if index==0
      temp = @head
      new_node.next_node = temp
      @head = new_node
    else
      pre_node = get_node(index-1)
      new_node.next_node = pre_node.next_node
      pre_node.next_node = new_node
      pre_node = pre_node.next_node
    end
  end
    
  def get(index)
    # your code here
    node = @head
    i=0
    while i<index do
      node = node.next_node
      i += 1
    end
    return node.value
  end
  
  def remove(index)
    pre_node = get_node(index-1)
    if pre_node!=nil
      curr_node = pre_node.next_node
      next_node = curr_node.next_node
      pre_node.next_node = next_node
    end
  end
end

list = LinkedList.new

list.add(3)
list.add(5)
puts list.get(1)



list = LinkedList.new

list.add(3)
list.add(5)
list.add_at(1, 11)
list.add_at(0, 13)

puts list.get(2)
# => 11

puts list.get(3)
# => 5
