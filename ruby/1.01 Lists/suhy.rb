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

  def get(index)
    # your code here
    node = @head
    i=0
    while (node!=nil && i<index)
      node = node.next_node
      i+=1
    end
    return node.value
  end
end

list = LinkedList.new

list.add(3)
list.add(5)
puts list.get(1)

