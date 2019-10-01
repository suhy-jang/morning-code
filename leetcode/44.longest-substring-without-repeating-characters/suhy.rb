# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
    longest_length = 0
    substr = []
    0.upto(s.size - 1) do |i|
        while (!substr.empty?) && (substr.include? s[i])
            substr.shift 
        end
        substr.push(s[i])
        longest_length = [longest_length, substr.size].max
    end
    longest_length
end
