
class Node
  attr_accessor :value, :next_node
  
  def initialize(value, next_node=nil)
    @value = value
    @next = next_node
  end
end

class Stack
  def initialize
    @top = nil
  end
  def push(number)
    node = Node.new(number)
    unless @top == nil
      node.next_node = @top
    end
    @top = node
  end
  
  def pop
    if @top == nil
      return nil
    end
    $temp = @top.value
    @top = @top.next_node
    return $temp
  end
  
  def top
    if nil == @top
      return nil
    end
    return @top.value
  end
  
  def isEmpty
    return nil == @top
  end
end

def is_match(a,b)
  if ((a=='{' && b=='}') || 
     (a=='(' && b==')') || 
     (a=='[' && b==']'))
    return true
  else
    return false
  end
end

def balanced_brackets?(string)
  result = true
  st = Stack.new
  string.split("").each do
    |c|
    if c=='{' || c=='(' || c=='['
      st.push(c)
    elsif c=='}' || c==')' || c==']'
      if (st.top !=nil && is_match(st.top, c)==true)
        st.pop
      else
        result=false
      end
    end
    break if false == result
  end
  return true==st.isEmpty && true==result
end

puts balanced_brackets?('(hello)[world]')
# => true

puts balanced_brackets?('([)]')
# => false

puts balanced_brackets?('[({}{}{})([])]')
# => true

puts balanced_brackets?(')(')
