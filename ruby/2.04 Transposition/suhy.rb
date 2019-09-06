def transpose(string)
  before = string.split("")
  after = []
  
  stack = []
  
  before.each do
    |m|
    if 'g' == m
      stack << m
      next
    end
    
    if 'n' != m
      while stack.any? do
        after << stack.pop
      end
    end
    
    after << m
  end
  
  while stack.any? do
    after << stack.pop
  end
  
  after = after.join("")
  
  return after
end

puts transpose('he was searchign on Bign for signign kigns')
# => he was searching on Bing for singing kings

puts transpose('rignadingdiggn!')
# => ringadingdingg!

puts transpose('gngngnnggnngggnnn')
# => nnnnnnnnngggggggg
