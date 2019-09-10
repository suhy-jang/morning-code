# @param {Integer} x
# @param {Integer} y
# @return {Integer}
def hamming_distance(x, y)
    (x^y).to_s(2).chars.count{|e|e=="1"}
end

# input: 3
#        1
# output: 1
