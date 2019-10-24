class Solution {
public:
    void moveZeroes(vector<int>& nums) {
        int zeroCount=0;
        int i=0;
        vector<int>::iterator itr = nums.begin();
        while (itr != nums.end()) {
            vector<int>::iterator nextItr = itr;
            nextItr++;
            if(*itr == 0) {
                zeroCount++;
                nums.erase(itr);
            } else {
                itr = nextItr;
            }
        }
        for(int i = 0; i < zeroCount; i++) {
            nums.push_back(0);
        }
        return;
    }
};
