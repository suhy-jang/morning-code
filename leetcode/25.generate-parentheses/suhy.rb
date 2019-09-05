# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
    ans = Array.new
    backtrack(ans, "", 0, 0, n)
    return ans
end

def backtrack(ans, cur, open, close, max)
    if cur.size == max*2
        ans << cur
        return
    end
    backtrack(ans, cur+"(", open+1, close, max) if open < max
    backtrack(ans, cur+")", open, close+1, max) if close < open
end
