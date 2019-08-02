# @param {Integer[]} prices
# @return {Integer}

def max_profit(prices)
  return 0 if prices.nil? || prices.empty? || prices.size == 1
  size = prices.size
  dp = Array.new(size+2) { Array.new(2, 0) }
  (size - 2).downto(0) do |i|
    dp[i][1] = [dp[i+1][0], dp[i+1][1]].max
    diff = prices[i+1] - prices[i]
    dp[i][0] = [ diff + dp[i+1][0], diff + dp[i+3][0], diff + dp[i+3][1] ].max
  end
  [ dp[0][0], dp[0][1] ].max
end

print max_profit([4,2,1]), " #=> 0\n"
print max_profit([2,1,4]), " #=> 3\n"
print max_profit([1,4,2]), " #=> 3\n"
