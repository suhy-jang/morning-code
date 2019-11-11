# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
    answer = Array.new(nums.size)
    answer[0] = 1
    1.upto(nums.size - 1) do |i|
        answer[i] = answer[i-1] * nums[i-1]
    end
    r = 1
    (nums.size - 1).downto(0) do |i|
        answer[i] = answer[i] * r
        r *= nums[i]
    end
    answer    
end
