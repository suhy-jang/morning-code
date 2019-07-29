def three_sum(nums)
    nums = nums.sort
    solutions = Set.new
    0.upto(nums.size - 2) do |start|
        next if start > 0 && nums[start] == nums[start - 1]
        left = start + 1
        right = nums.size - 1
        while left < right
            sum = nums[start] + nums[left] + nums[right]
            if sum.zero?
                solutions << [nums[start], nums[left], nums[right]]
                left += 1
                right -= 1
            elsif sum < 0
                left += 1
            else
                right -= 1
            end
        end
    end
    solutions.to_a
end

print three_sum([3,0,-2,-1,1,2])
