# https://leetcode.com/problems/decode-string
# @param {String} s
# @return {String}

$idx = 0

def decode_string(s)
    $idx = 0
    decode_string_h(s)
end

def decode_string_h(s)
    decode = ''
    num = 0
    while $idx < s.size
        char = s[$idx]
        if char >= '0' && char <= '9'
            num = 10*num + char.to_i
        elsif char == '['
            $idx += 1
            str = decode_string_h(s)
            until num.zero? do
                decode += str
                num -= 1
            end
        elsif char == ']'
            return decode
        else  # alphabet
            decode += char
        end
        $idx += 1
    end
    decode
end

# input : "3[a2[c]]"
# output : "accaccacc"
