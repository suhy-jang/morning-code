# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def find_kth_largest(nums, k)
    size = nums.max + 1
    counts = nums.each_with_object(Hash.new(0)) do |num, hash|
        hash[num] += 1
    end
    keys = counts.keys()
    keys.max.downto(keys.min) do |i|
        next if counts[i].nil?
        return i if k - counts[i] <= 0
        k -= counts[i]
    end
    -1
end
