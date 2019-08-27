# @param {String} word1
# @param {String} word2
# @return {Integer}
def min_distance(word1, word2)
    n = word1.size
    m = word2.size
    dp = Array.new(n+1) { Array.new(m+1) }
    0.upto(n).each { |i| dp[i][0] = i }
    0.upto(m).each { |i| dp[0][i] = i }
    1.upto(n).each do |ni|
        1.upto(m).each do |mi|
            if word1[ni-1] == word2[mi-1]
                dp[ni][mi] = dp[ni-1][mi-1]
            else
                dp[ni][mi] = 1 + [dp[ni-1][mi-1], dp[ni-1][mi], dp[ni][mi-1]].min
            end
        end
    end
    dp[n][m]        
end

# input : "horse"
#         "ros"
# output : 3
