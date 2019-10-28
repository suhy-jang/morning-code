# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def next_permutation(nums)
    i = nums.size - 2
    while i >= 0 && nums[i] >= nums[i+1]
        i -= 1
    end
    if i >= 0
        j = nums.size - 1
        while j >= 0 && nums[i] >= nums[j]
            j -= 1
        end
        swap(nums, i, j)
    end
    reverse(nums, i+1)
end

def reverse(nums, i)
    j = nums.size - 1
    while i < j
        swap(nums, i, j)
        i += 1
        j -= 1
    end
end

def swap(nums, i, j)
    nums[i], nums[j] = nums[j], nums[i]
end
