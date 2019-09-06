class Node
  attr_accessor :value, :next_node
  
  def initialize(value, next_node = nil)
	  @value = value
    @next_node = next_node
  end
end

class Stack
  def initialize()
    @top = nil
    @arr = Hash.new(0)
    @min = 0
  end

  def push(number)
    node = Node.new(number)
    unless @top == nil
      node.next_node = @top
    end
    @top = node
    @arr[number] += 1
    @min = @arr.min[0]
  end
  
  def pop
    unless @top == nil
      temp = @top.value
      @arr[temp] -= 1
      if @arr[temp] == 0
        @arr.delete(temp)
      end
      @top = @top.next_node
      @min = @arr.min[0]
    end
  end
  
  def min
    return @min
  end

end

stack = Stack.new
stack.push(3)
stack.push(5)
puts stack.min
# => 3

stack.pop
stack.push(7)
puts stack.min
# => 3

stack.push(2)
puts stack.min
# => 2

stack.pop
puts stack.min
# => 3
