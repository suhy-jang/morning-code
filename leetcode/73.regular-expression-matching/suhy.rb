# @param {String} s
# @param {String} p
# @return {Boolean}
def is_match(s, p)
    if p.empty?
        return s.empty?
    end
    
    first_match = s.length > 0 && (s[0] == p[0] || p[0] == '.')
    if p.length >= 2 && p[1] == '*'
        return is_match(s, p[2..-1]) || (first_match && is_match(s[1..-1], p))
    else
        return first_match && is_match(s[1..-1], p[1..-1])
    end
end
