# @param {String} s
# @param {String} p
# @return {Integer[]}
def find_anagrams(s, p)
    ms = counting(s, p.size-1)
    mp = counting(p, p.size-1)
    finish = s.size - p.size
    indexes = Array.new
    0.upto(finish).each do |i|
        indexes << i if mp == ms
        break if i == finish
        ms[s[i]] -= 1
        ms[s[i+p.size]] += 1
    end
    indexes
end

def counting(str, finish)
    m = Hash.new(0)
    'a'.upto('z').each do |c|
        m[c] = 0
    end
    0.upto(finish).each do |i|
        m[str[i]] += 1
    end
    m
end
