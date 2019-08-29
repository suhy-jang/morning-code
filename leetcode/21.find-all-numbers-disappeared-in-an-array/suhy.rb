# @param {Integer[]} nums
# @return {Integer[]}
def find_disappeared_numbers(nums)
    return [] if nums.empty?
    appears = Array.new(nums.size, 0)
    nums.each do |num|
        appears[num-1] -= 1
    end
    rest = Array.new
    appears.each_with_index do |num, i|
        rest << (i+1) if num.zero?
    end
    rest
end

input : [1,1]
output : [2]

input : []
output : []
