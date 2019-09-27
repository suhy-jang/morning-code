# @param {Integer[]} nums
# @return {Integer}
def longest_consecutive(nums)
    return 0 if nums.size.zero?
    cons = SortedSet.new
    nums.each { |num| cons.add(num) }
    longest_streak = 0
    cons_arr = cons.to_a
    i = 0
    while i < cons_arr.size do
        unless cons.include? cons_arr[i]-1
            curr_streak = 1
            while cons.include? cons_arr[i]+1
                curr_streak += 1
                i += 1
            end
            longest_streak = [longest_streak, curr_streak].max
        end
        i += 1
    end
    longest_streak
end
