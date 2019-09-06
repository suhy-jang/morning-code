def sqrt(number)
  sqrt_recursive(number, 0, number)
end

def sqrt_recursive(number, min_interval, max_interval)
  s = min_interval
  e = max_interval
  m = (s+e).to_f/2
  if e==s
    return m
  end
  
  expn = m**2
  if (expn-number) == 0
    return m
  elsif expn > number
    sqrt_recursive(number, s,m)
  else # expn < number
    sqrt_recursive(number, m,e)
  end
  
end

puts sqrt(25)
puts sqrt(7056)
puts sqrt(9)

