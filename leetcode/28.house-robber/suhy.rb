# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
    return 0 if nums.empty?
    comp = Array.new(nums.size) { Array.new(2,0) } # 0: include, 1: exclude
    i=0
    while i < nums.size
        #include
        comp[i][0] = nums[i]
        comp[i][0] += comp[i-1][1] if i-2 >= 0
        #exclude
        comp[i][1] = [comp[i-1][0], comp[i-1][1]].max if i-1 >= 0
        i += 1
    end
    [comp[i-1][0], comp[i-1][1]].max
end

# input:  []  [1]  [1,2,3,1]
# output: 0    1    4
