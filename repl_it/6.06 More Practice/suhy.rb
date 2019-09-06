def find_pairs(array, k)
  pairs = Array.new
  map = Hash.new
  array.each_with_index do |elem,idx|
    pairs << [map[elem], elem] if map.include? elem
    map[k-elem]=elem
  end
  pairs
end

p find_pairs([1, 9, 11, 13, 2, 3, 7], 12)
# => [[1, 11], [9, 3]]
