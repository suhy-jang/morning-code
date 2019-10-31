# Manacher's Algorithm
# @param {String} s
# @return {Integer}
def count_substrings(s)
    a = Array.new(2*s.length + 3, '')
    a[0] = '@'
    a[1] = '#'
    a[a.length - 1] = '$'
    t = 2
    s.each_char do |c|
        a[t] = c
        t += 1
        a[t] = '#'
        t += 1
    end
    z = Array.new(a.length, 0)
    center = 0
    right = 0
    1.upto(z.length - 1) do |i|
        if i < right
            z[i] = [right-i, z[2*center-i]].min
        end
        while a[i + z[i] + 1] == a[i - z[i] - 1]
            z[i] += 1
        end
        if i + z[i] > right
            center = i
            right = i + z[i]
        end
    end
    ans = 0
    z.each do |v|
        ans += (v + 1) / 2
    end
    ans
end
