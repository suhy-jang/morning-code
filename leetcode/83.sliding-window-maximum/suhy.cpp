class Solution {
public:
    vector<int> maxSlidingWindow(vector<int>& nums, int k) {
        if (nums.size() == 0) {
            vector<int> temp;
            return temp;
        }
        
        deque<pair<int, int>> window;
        vector<int> res(nums.size() - k + 1);
        for(int i = 0 ; i < nums.size() ; i++) {
            if (window.size() > 0 && window.front().second <= i - k) {
                window.pop_front();
            }
            while (window.size() > 0 && window.back().first <= nums[i]) {
                window.pop_back();
            }
            window.push_back(make_pair(nums[i], i));
            if (i - k + 1 >= 0) {
                res[i - k + 1] = window.front().first;
            }
        }
        return res;
    }
};
