# @param {Integer[]} nums
# @return {Integer[]}
require 'set'
def find_disappeared_numbers(nums)
    return [] if nums.empty?
    set = Set.new(1..nums.size)
    nums.each do |num|
        set.delete(num) if set.include? num
    end
    set.to_a
end

input : [1,1]
output : [2]

input : []
output : []
