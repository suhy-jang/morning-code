/**
 * @param {number[]} nums
 * @return {boolean}
 */
var canPartition = function(nums) {
    if (nums.length === 0) return true;
    
    let sum = 0;
    for (let i = 0; i < nums.length; i++) {
        sum += nums[i];
    }
    if (sum % 2 === 1) return false;
    
    sum = sum / 2;
    let dp = new Array(sum + 1);
    dp.fill(false);
    dp[0] = true;
    
    for (let i = 1 ; i <= nums.length; i++) {
        for (let j = sum; j >= 0 && j >= nums[i-1]; j--) {
            if (dp[sum]) return true;
            else if (nums[i-1] === j) {
                dp[j] = true;
            } else {
                dp[j] = dp[j] || dp[j-nums[i-1]];
            }
        }
    }
    return dp[sum];
};
