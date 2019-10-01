class Solution {
public:
    int lengthOfLongestSubstring(string s) {
        unordered_set<int> set;
        int ans = 0, i = 0, j = 0;
        while (i < s.length() && j < s.length()) {
            if (set.find(s[j]) == set.end()) {
                set.insert(s[j++]);
                ans = max(ans, j-i);
            } else {
                set.erase(s[i++]);
            }
        }
        return ans;
    }
};
