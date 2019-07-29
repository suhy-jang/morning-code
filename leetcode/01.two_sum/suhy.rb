def two_sum(nums, target)
    m = Hash.new(-1)
    pair = [-1, -1]
    nums.each_with_index do |num, idx|
        if m[num] >= 0
            pair = [m[num], idx]
            break
        end
        m[target - num] = idx
    end
    pair
end

two_sum([2,7,11,15], 9)
# expect => [0,1]
