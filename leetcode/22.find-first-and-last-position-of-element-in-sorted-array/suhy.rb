# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
    return [0, nums.size-1] if nums[0] == target && nums[-1] == target
    find_place(nums, target, 0, nums.size-1)
end

def find_place(nums, target, start, finish)
    return [-1,-1] if start > finish
    mid = (start+finish)/2
    if nums[mid] == target
        start = finish = mid
        until (nums[start-1] != target)
            start -= 1
        end
        until (nums[finish+1] != target)
            finish += 1
        end
        return [start, finish]
    elsif nums[mid] < target
        find_place(nums, target, mid+1, finish)
    else
        find_place(nums, target, start, mid-1)
    end
end
