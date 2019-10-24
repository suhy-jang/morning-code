/**
 * @param {number[]} nums
 * @return {void} Do not return anything, modify nums in-place instead.
 */
var moveZeroes = function(nums) {
    for(let i=0, j=0; i<nums.length; i++) {
        if(nums[i] != 0) {
            [ nums[j], nums[i] ] = [ nums[i], nums[j] ];
            j += 1;
        }
    }
};
