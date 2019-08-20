# @param {Integer} num
# @return {Integer[]}
def count_bits(num)
    dp = Array.new(num+1)
    dp[0] = 0
    1.upto(num)do |i|
        if (i & 1).zero?
            dp[i] = dp[i>>1]
        else
            dp[i] = dp[i-1] + 1
        end
    end
    dp
end

# input : 2
# output : [0,1,1]
