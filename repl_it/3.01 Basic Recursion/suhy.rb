$remember = Hash.new

def sum(number)
  if 0 == number
    return 0
  elsif $remember && $remember[number] != nil
    return $remember[number]
  end
  
  current_sum = number + sum(number-1)
  $remember[number] = current_sum
  return current_sum
end

puts sum(4)
puts sum(10)
