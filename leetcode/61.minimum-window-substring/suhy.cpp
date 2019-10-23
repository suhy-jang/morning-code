class Solution {
public:
    string minWindow(string s, string t) {
        if (s.length() == 0 || t.length() == 0) return "";
        unordered_map<char, int> m;
        int left=0;
        int right=0;
        for(char& c : t) {
            if (m.find(c) == m.end()) {
                m[c] = 0;
            }
            m[c] += 1;
        }
        int required = m.size();
        int formed = 0;
        unordered_map<char, int> windowCounts;
        array<int, 3> ans = {-1, 0, 0}; // length, left, right
        while (right < s.length()) {
            char c = s[right];
            if (windowCounts.find(c) == windowCounts.end()) {
                windowCounts[c] = 0;
            }
            windowCounts[c] += 1;
            if (m.find(c) != m.end() && windowCounts[c] == m[c]) {
                formed++;
            }
            while(left <= right && formed == required) {
                char c = s[left];
                if (ans[0] == -1 || right - left + 1 < ans[0]) {
                    ans[0] = right - left + 1;
                    ans[1] = left;
                    ans[2] = right;
                }
                windowCounts[c]--;
                if(m[c] && windowCounts[c] < m[c]) {
                    formed--;
                }
                left++;
            }
            right++;
        }
        return (ans[0] == -1) ? "" : s.substr(ans[1], ans[2]-ans[1]+1);
    }
};
