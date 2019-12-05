class Solution {
public:
    int subarraySum(vector<int>& nums, int k) {
        int count = 0;
        int sum = 0;
        unordered_map<int, int> map;
        map[0] = 1;
        for (int n : nums) {
            sum += n;
            count += map[sum - k];
            map[sum]++;
        }
        return count;
    }
};
