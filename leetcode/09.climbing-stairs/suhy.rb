# https://leetcode.com/problems/climbing-stairs/

# @param {Integer} n
# @return {Integer}
$memo = []

def climb_stairs(n)
    $memo = Array.new(n)
    climb_stairs_h(n)
end

def climb_stairs_h(n)
    return $memo[n] if $memo[n]
    if n<=2
        $memo[n] = n
    else
        $memo[n] = climb_stairs_h(n-2) + climb_stairs_h(n-1)
    end
    $memo[n]
end

# 0->0, 1->1, 2->2, 3->3
