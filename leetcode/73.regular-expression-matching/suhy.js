/**
 * @param {string} s
 * @param {string} p
 * @return {boolean}
 */
const isMatch = (s, p) => {
    if (p.length === 0) {
        return s.length === 0;
    }
    const m = s.length;
    const n = p.length;
    const firstMatch = s.length > 0 && (s[0] == p[0] || p[0] == '.')
    if (p.length >= 2 && p[1] == '*') {
        return isMatch(s, p.substring(2,n)) || (firstMatch && isMatch(s.substring(1, m), p));
    } else {
        return firstMatch && isMatch(s.substring(1, m), p.substring(1, n));
    }        
};
