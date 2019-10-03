# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
    candidate = nil
    count = 0
    nums.each do |num|
        candidate = num if count.zero?
        count += candidate == num ? 1 : -1
    end
    candidate
end

# We can solve either using sort or hash saving value to check which element appears major times.
# In the given constraints, however, the majority element appears more than O(n/2) times; 
# it means every second times we ensure the major element will be appering.
# And if we update major element info at right moment, we can get majority element.
 # 3 1 3 4 3 2 4 2 4 4 5
 # 3   3   3   4   4    
 # 1 0 1 0 1 0 1 0 1 2 1
