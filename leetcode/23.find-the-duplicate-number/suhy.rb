# @param {Integer[]} nums
# @return {Integer}
def find_duplicate(nums)
    nums.sort!
    nums.each_index do |i|
        return nums[i] if nums[i-1] == nums[i] || nums[i] == nums[i+1]
    end
    nil
end
