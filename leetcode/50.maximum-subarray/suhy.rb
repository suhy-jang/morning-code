# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
    helper(nums, 0, nums.size-1)
end

def helper(nums, left, right)
    return nums[left] if left == right
    p = (left + right) / 2
    left_sum = helper(nums, left, p)
    right_sum = helper(nums, p+1, right)
    cross_sum = cross_sum(nums, left, right, p)
    [left_sum, right_sum, cross_sum].max
end

def cross_sum(nums, left, right, p)
    return nums[left] if left == right
    
    left_sub_sum = nums.min
    curr_sum = 0
    p.downto(left) do |i|
        curr_sum += nums[i]
        left_sub_sum = [left_sub_sum, curr_sum].max
    end
    
    right_sub_sum = nums.min
    curr_sum = 0
    (p+1).upto(right) do |i|
        curr_sum += nums[i]
        right_sub_sum = [right_sub_sum, curr_sum].max
    end
    left_sub_sum + right_sub_sum
end
