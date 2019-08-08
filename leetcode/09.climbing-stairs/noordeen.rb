# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
    dp = Hash.new
    dp[0] = 1
    dp[1] = 1
    i = 2
    while i<= n do
        dp[i] = dp[i-1] + dp[i-2]
        i +=1
    end
    dp[n]
end
