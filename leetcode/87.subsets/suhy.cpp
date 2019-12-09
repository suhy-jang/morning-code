class Solution {
public:
    vector<vector<int>> subsets(vector<int>& nums) {
        vector<vector<int>> res { vector<int> {} };
        generateSS(nums, res);
        return res;
    }
    
    void generateSS(vector<int>& nums, vector<vector<int>>& res) {
        for(int i = 0; i < nums.size(); i++) {
            vector<vector<int>> connect;
            for(vector<int> s : res) {
                vector<int> temp = s;
                temp.push_back(nums[i]);
                connect.push_back(temp);
            }
            res.insert(res.end(), connect.begin(), connect.end());
        }
    }
    
};
