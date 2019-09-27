# @param {String} s
# @return {Integer}
def longest_valid_parentheses(s)
    maxans = 0
    dp = Array.new(s.size, 0)
    1.upto(s.size-1) do |i|
        if s[i] == ')'
            if s[i-1] == '('
                dp[i] = (i >= 2 ? dp[i-2] : 0) + 2
            elsif i - dp[i-1] > 0 && s[i - dp[i-1] - 1] == '('
                dp[i] = dp[i-1] + ((i-dp[i-1]) >= 2 ? dp[i-dp[i-1]-2]:0) + 2
            end
            maxans = [maxans, dp[i]].max
        end
    end
    maxans
end
