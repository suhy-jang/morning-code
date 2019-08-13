# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum(candidates, target)
    candidates.sort!
    results = Array.new
    combination_sum_helper(candidates, [], 0, target, results )
    results
end

def combination_sum_helper(candidates, sums, index, target, results)
    return nil if candidates[index] > target
    index.upto(candidates.size-1) do |i|
        break if candidates[i] > target
        sums << candidates[i]
        if target == candidates[i]
            return results << sums
        else
            combination_sum_helper(candidates, copy(sums), i, target-candidates[i], results)
        end
        sums.pop
    end
end

def copy(arr)
    arr.map { |e| e }
end

# input : [2,3,6,7]
#          7
# output : [[2,2,3],[7]]
