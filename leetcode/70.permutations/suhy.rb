# @param {Integer[]} nums
# @return {Integer[][]}
def swap(nums, i, j)
    nums[i], nums[j] = nums[j], nums[i]
end

def backtrack(n, nums, output, first)
    if first == n
        output.push Array.new(nums) 
    end
    first.upto(n-1) do |i|
        swap(nums, first, i)
        backtrack(n, nums, output, first + 1)
        swap(nums, first, i)
    end
end

def permute(nums)
    output = []
    backtrack(nums.length, Array.new(nums), output, 0)
    output
end
