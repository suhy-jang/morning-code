# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def swap(arr, a, b)
    arr[a], arr[b] = arr[b], arr[a]
end

def sort_colors(nums)
    i = 0
    next_zero = 0
    next_two = nums.size - 1
    while i <= next_two
        if nums[i] == 0
            swap(nums, i, next_zero)
            next_zero += 1
            i += 1
        elsif nums[i] == 2
            swap(nums, i, next_two)
            next_two -= 1
        else
            i += 1
        end
    end
    nums
end
