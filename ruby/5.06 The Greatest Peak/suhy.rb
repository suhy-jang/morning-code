
def greatest_peaks(map)
 connected_graph = graph(map)
 arr = connected_paths(connected_graph)
 result = []
 arr.each_with_index{|data, i|
   arr[i] = data.uniq
 }
 arr.each{|array|
   arr.each{|array2|
     if (array & array2).length > 0
       new_array = (array + array2).uniq
       array = new_array
     end
   }
   result << array
 }
 new_res = []
 result.each{|a|
   new_res << a.length
 }
 new_res.minmax
end

def graph(map)
 graph = {}
 for i in (0..map.length-1)
   for j in (0..map.length-1)
     path ={}
     s = (i+1).to_s + j.to_s
     path[s] = map[i+1][j] if (i+1)<map.length && !((map[i+1][j]).nil?)
     s = (i-1).to_s + j.to_s
     path[s] = map[i-1][j] if (i-1)>=0 && !((map[i-1][j]).nil?)
     s = i.to_s + (j+1).to_s
     path[s] = map[i][j+1] if (j+1)<map.length && !((map[i][j+1]).nil?)
     s = i.to_s + (j-1).to_s
     path[s] = map[i][j-1] if (j-1)>=0 && !((map[i][j-1]).nil?)
     s = i.to_s + j.to_s
     position = get_position(path)
     graph[s] = position if map[i][j] < path[position]
   end
 end
 graph
end
def get_position(path)
 pos = ""
 max = 0
 keys = path.keys
 keys.each{|key|
   if max < path[key]
     max = path[key]
     pos = key
   end
 }
 pos
end

def connected_paths(graph)
 result = []
 i = 0
 graph.each{|node|
 found = false
   if i == 0
     new_ar = []
     new_ar << node[0]
     new_ar << node[1]
     result << new_ar
   else
     result.each_with_index{|val, index|
       if val.include?(node[0]) || val.include?(node[1])
         val << node[0]
         val << node[1]
         result[index] = val
         found = true
         break
       end
     }
     if found == false
        new_ar = []
        new_ar << node[0]
        new_ar << node[1]
        result << new_ar
      end
   end
   i += 1
 }
 result
end

p greatest_peaks(
  [
    [9, 8, 5], 
    [5, 6, 3], 
    [8, 4, 1]
  ]
)
# => [3, 6]

p greatest_peaks(
  [
    [8, 12], 
    [9, 3]
  ]
)
# => [1, 3]
