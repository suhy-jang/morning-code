/**
 * @param {number[]} nums
 * @return {number}
 */
let lengthOfLIS = function(nums) {
    if (nums.length === 0) return 0;
    let dp = new Array(nums.length);
    dp.fill(0);
    dp[0] = 1;
    let maxans = 1;
    for (let i = 0; i < nums.length; i++) {
        let maxval = 0;
        for (let j = 0; j < i; j++) {
            if (nums[j] < nums[i]) {
                maxval = Math.max(maxval, dp[j]);
            }
            dp[i] = maxval + 1;
            maxans = Math.max(maxans, dp[i]);
        }
    }
    return maxans;
};
