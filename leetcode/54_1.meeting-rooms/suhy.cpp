class Solution {
public:
    bool canAttendMeetings(vector<vector<int>>& intervals) {
        bool res = true;
        int last_ending = 0;
        sort(intervals.begin(), intervals.end());
        for(vector<int> interval : intervals) {
            int start = interval[0];
            int ending = interval[1];
            if (start < last_ending) {
                res = false;
                break;
            }
            last_ending = ending;
        }
        return res;
    }
};
