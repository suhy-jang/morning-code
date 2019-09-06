$disk = [1,2]

def move(starting, goal)
  say = ""
  mid = (1..3).find { |number| number != starting && number != goal }
  tower = [[0,0],[1,0],[2,0],[3,0]]
  tower[starting][1] += $disk[1]
  tower[starting][1] += $disk[0]
  #move disk top
  tower[starting][1] -= $disk[0]
  tower[mid][1]+= $disk[0]
  say += "#{starting}->#{mid} "
  #move disk bottom
  tower[starting][1] -= $disk[1]
  tower[goal][1] += $disk[1]
  say += "#{starting}->#{goal} "
  #move disk top
  tower[mid][1] -= $disk[0]
  tower[goal][1] += $disk[0]
  say += "#{mid}->#{goal}"
  return say
end

puts move(1, 3)
# => 1->2 1->3 2->3

puts move(2, 3)
# => 2->1 2->3 1->3

