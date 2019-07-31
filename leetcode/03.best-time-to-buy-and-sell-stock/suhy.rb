def max_profit(prices)
    buy = nil
    max_profit = 0
    prices.each do |price|
        if buy.nil? || price <= buy
            buy = price
        else
            profit = price - buy
            max_profit = profit if max_profit < profit
        end
    end
    max_profit
end

p max_profit([7,1,5,3,6,4])
