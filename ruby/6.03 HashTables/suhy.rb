
def create_hash_set(arr)
  hash = Hash.new
  arr.each do |e|
    num = e.abs % 11
    if hash.include? num
      hash[num] << e
    else
      hash[num] = [e]
    end
  end
  hash
end

def sort_by_key(hash)
  hash.sort_by{|k,v|k}
end

def iterate_hash_set(hash)
  result = []
  sort_by_key(hash).each do |_,v|
    v.each do |e|
      result << e
    end
  end
  result
end

def hash_table(arr)
  hash = create_hash_set(arr)
  iterate_hash_set(hash)
end

# 7832, -3289, 980, 2367, 134, 3291, 3, -65325, -65326, 789, -185007
p hash_table([2367, -65325, 134, -185007, 3291, 7832, -65326, 789, 980, -3289, 3])
p hash_table([12, 24, 125, 5, 91, 1106, 2, 1021, 29, 3536, 10])
# => [12, 24, 2, 91, 125, 5, 3536, 1106, 29, 1021, 10]

p hash_table([2, 341, 73, 8265, 234004, 602, 7400000, 200000000])
# => [341, 234004, 2, 200000000, 7400000, 8265, 73, 602]
