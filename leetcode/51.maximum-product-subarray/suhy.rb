# @param {Integer[]} nums
# @return {Integer}
def max_product(nums)
    return 0 if nums.size.zero?
    max_val = [nums[0], nums[-1]].max
    dp = Array.new(nums.size, 1)
    dp[0] = nums[0]
    1.upto(nums.size-1) do |i|
        dp[i] = dp[i-1].zero? ? nums[i] : dp[i-1] * nums[i]
        max_val = [max_val, dp[i]].max
    end
    dp = Array.new(nums.size, 1)
    dp[nums.size-1] = nums[nums.size-1]
    (nums.size-2).downto(0) do |i|
        dp[i] = dp[i+1].zero? ? nums[i] : dp[i+1] * nums[i]
        max_val = [max_val, dp[i]].max
    end
    max_val
end
