# https://leetcode.com/problems/climbing-stairs/

# @param {Integer} n
# @return {Integer}
# @param {Integer} n
# @return {Integer}

def climb_stairs(n)
    memo = Array.new(n+1)
    climb_stairs_h(n, memo)
end

def climb_stairs_h(n, memo)
    return memo[n] if memo[n]
    if n<=2
        memo[n] = n
    else
        memo[n] = climb_stairs_h(n-2, memo) + climb_stairs_h(n-1, memo)
    end
    memo[n]
end

# 0->0, 1->1, 2->2, 3->3
