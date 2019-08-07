# @param {Integer[]} nums
# @return {Integer}
def max_coins(nums)
    nums.unshift(1)
    nums.push(1)
    dp = Array.new(nums.size){ Array.new(nums.size, -1) }
    max_coins_helper(dp, nums, 1, nums.size-2)
end

def max_coins_helper(dp, nums, start, finish)
    return 0 if start > finish
    return dp[start][finish] unless dp[start][finish] == -1
    max = 0
    start.upto(finish) do |i|
        left = max_coins_helper(dp, nums, start, i - 1)
        right = max_coins_helper(dp, nums, i+1, finish)
        curr = nums[start - 1] * nums[i] * nums[finish + 1] + left + right
        max = [max, curr].max
    end
    dp[start][finish] = max
    return max
end

# max_coins([1,5]) #=> 10
