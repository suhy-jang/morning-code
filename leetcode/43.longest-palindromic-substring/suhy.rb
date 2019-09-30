# @param {String} s
# @return {String}
def longest_palindrome(s)
    return s if s.size <= 1
    start, finish = 0, 0
    0.upto(s.size-1) do |i|
        odd = expand_around_center(s, i, i)
        even = expand_around_center(s, i, i+1)
        len = [odd, even].max
        if len > finish - start
            start = i - (len - 1) / 2
            finish = i + len / 2
        end
    end
    s[start..finish]
end

def expand_around_center(s, start, finish)
    return 0 if start < 0 || finish >= s.size
    while start >= 0 && finish < s.size && s[start] == s[finish]
        start -= 1
        finish += 1
    end
    
    return finish - start - 1
end

# aba
# abba

# dp:
# P(i, j) -> true if the substring Si .. Sj is a palindrome
#         -> false otherwise
# P(i, j) = (P(i+1, j-1) and Si == Sj)
# base cases
#   P(i, i) = true
#   P(i, i+1) = (Si == Si+1)

# center 2n-1 searches with O(n^2) time complexity
