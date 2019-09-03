# @param {Integer[]} nums
# @return {Integer}
def find_duplicate(nums)
    hare = nums[0]
    tortoise = nums[0]
    loop do
        tortoise = nums[tortoise]
        hare = nums[nums[hare]]
        break if tortoise == hare
    end
    ptr1 = nums[0]
    ptr2 = tortoise
    until ptr1 == ptr2
        ptr1 = nums[ptr1]
        ptr2 = nums[ptr2]
    end
    return ptr1
end
