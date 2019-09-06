

def move_disk(start, goal, spare, n)
  if(n==1)
    puts "#{start}->#{goal}"
    return
  end
  move_disk(start,spare,goal,n-1)
  move_disk(start,goal,spare,1)
  move_disk(spare,goal,start,n-1)
end

def hanoi_steps(number_of_discs)
  move_disk(1,3,2,number_of_discs)
end

#hanoi_steps(2)
#hanoi_steps(3)
hanoi_steps(4)
