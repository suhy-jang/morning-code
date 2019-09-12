# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
    return 0 if nums.size.zero?
    return nums[0] if nums.size == 1
    [rob_between(nums, 0, nums.size-1), rob_between(nums, 1, nums.size)].max
end

def rob_between(nums, start, finish) # finish exclusive
    return 0 if (finish - start).zero?
    return nums[start] if (finish - start) == 1
    comp = Array.new(finish) { Hash.new(0) }
    i=start
    while i < finish
        comp[i][:include] = nums[i] + comp[i-1][:exclude]
        comp[i][:exclude] = [comp[i-1][:include], comp[i-1][:exclude]].max
        i += 1
    end
    [comp[finish-1][:include], comp[finish-1][:exclude]].max
end
