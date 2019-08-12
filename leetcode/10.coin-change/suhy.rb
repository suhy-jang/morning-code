# @param {Integer[]} coins
# @param {Integer} amount
# @return {Integer}
def coin_change(coins, amount)
    max = amount + 1
    dp = Array.new(amount+1, max)
    dp[0] = 0
    1.upto(amount) do |i|
        coins.each_with_index do |coin, j|
            if coin <= i
                dp[i] = [dp[i], dp[i-coin]+1].min 
            end
        end
    end
    dp[amount] > amount ? -1 : dp[amount]
end
    
input : [2]
        3
output : -1
