# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
    zero_num = 0
    multiply_all = nums.inject { |acc, e| e.zero? ? (zero_num += 1; acc) : acc * e }
    return nums.map { 0 } if zero_num >= 2
    
    nums.map do |e| 
        if e.zero?
            multiply_all
        elsif !e.zero? && zero_num > 0
            0
        else
            multiply_all / e
        end
    end
end
