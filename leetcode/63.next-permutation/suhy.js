/**
 * @param {number[]} nums
 * @return {void} Do not return anything, modify nums in-place instead.
 */
let swap = function(arr, left, right) {
    [arr[left], arr[right]] = [arr[right], arr[left]];
}

let reverse = function(arr, left) {
    let right = arr.length - 1;
    while (left < right) {
        swap(arr, left, right);
        left += 1;
        right -= 1;
    }
}

let nextPermutation = function(nums) {
    let i = nums.length - 2;
    while (i >= 0 && nums[i] >= nums[i+1]) {
        i -= 1;
    }
    if (i >= 0) {
        let j = nums.length - 1;
        while (j >= 0 && nums[i] >= nums[j]) {
            j -= 1;
        }
        swap(nums, i, j);
    }
    reverse(nums, i+1);
};
