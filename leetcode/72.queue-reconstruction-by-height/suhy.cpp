class Solution {
public:
    static bool compare(vector<int> a, vector<int> b) {
        return ((a[0] == b[0]) ? a[1] < b[1] : b[0] < a[0]);
    }
    
    vector<vector<int>> reconstructQueue(vector<vector<int>>& people) {
        vector<vector<int>> result;
        sort(people.begin(), people.end(), compare);
        for(vector<int> p : people) {
            if (result.size() <= p[1]) {
                result.push_back(p);
            } else {
                result.insert(result.begin() + p[1], p);
            }
        }
        return result;
    }
};
