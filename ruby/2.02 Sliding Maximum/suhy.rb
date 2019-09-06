class Node
  attr_accessor :value, :next_node, :prev_node
  
  def initialize(value, prev_node = nil, next_node = nil)
    @value = value
    @prev_node = prev_node
    @next_node = next_node
  end
end

class Dequeue
  def initialize
    @head = nil
    @tail = nil
    @empty = nil
  end
  
  def create(node)
    @head = node
    @tail = node
  end
  
  def push_back(number)
    node = Node.new(number)
    if @tail == nil
      create(node)
    else
      node.prev_node = @tail
      @tail.next_node = node
      @tail = node
    end
  end
  
  def pop_front
    if @head == nil
      return nil
    else
      value = @head.value
      @head = @head.next_node
      @head.prev_node = nil
      return value
    end
  end
  
  def pop_back
    if @tail == nil
      return nil
    else
      value = @tail.value
      @tail = @tail.prev_node
      return value
    end
  end
  
  def back
    if @tail == nil
      return nil
    end
    return @tail.value
  end
  
  def front_node
    if @head == nil
      return nil
    end
    return @head.value
  end
  
end

def sliding_maximum(k, array)
  deq = Dequeue.new
  result = []
  i=0
  array.each do
    |num|
    if (deq.front_node != nil && deq.front_node[1] <= i-k)
        deq.pop_front
    end
    while (deq.back != nil && deq.back[0] < num) do
      deq.pop_back
    end
    deq.push_back([num,i])
    unless (i-k+1)<0
      result << deq.front_node[0]
    end
    i+=1
  end
  return result
end

sliding_maximum(3, [1, 3, 5, 7, 9, 2])
# => [5, 7, 9, 9]

