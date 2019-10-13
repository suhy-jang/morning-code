# @param {String} j
# @param {String} s
# @return {Integer}
def num_jewels_in_stones(j, s)
    stones = s.split('')
    num = 0
    j.each_char do |c|
        num += stones.count(c)
    end
    num
end
