# @param {Integer[]} nums
# @return {Integer}
def length_of_lis(nums)
    return 0 if nums.size.zero?
    dp = Array.new(nums.size, 0)
    dp[0] = 1
    maxans = 1
    nums.each_with_index do |num, i|
        maxval = 0
        0.upto(i-1) do |j|
            maxval = [maxval, dp[j]].max if nums[j] < num
        end
        dp[i] = maxval + 1
        maxans = [maxans, dp[i]].max
    end
    maxans
end
