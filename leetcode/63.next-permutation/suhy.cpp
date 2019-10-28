class Solution {
private:
    void swap(vector<int>& nums, int i, int j) {
        int temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
    }
    
    void reverse(vector<int>& nums, int i) {
        int j = nums.size() - 1;
        while (i < j) {
            this->swap(nums, i, j);
            i++;
            j--;
        }
    }
    
public:
    void nextPermutation(vector<int>& nums) {
        int i = nums.size() - 2;
        while(i >= 0 && nums[i] >= nums[i+1]) {
            i--;
        }
        if(i >= 0) {
            int j = nums.size() - 1;
            while(j >= 0 && nums[i] >= nums[j]) {
                j--;
            }
            this->swap(nums, i, j);
        }
        this->reverse(nums, i+1);
    }
    
};
