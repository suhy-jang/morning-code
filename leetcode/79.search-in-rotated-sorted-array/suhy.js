/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number}
 */
const searchPivot = (nums) => {
    let pivot;
    const zero = nums[0];
    let start = 0;
    let finish = nums.length - 1;
    while (start <= finish) {
        const mid = Math.floor((start + finish) / 2);
        if (mid+1 >= nums.length) break;
        if (nums[mid] > nums[mid + 1]) {
            pivot = mid + 1;
            break;
        } else if (nums[mid] >= zero) {
            start = mid + 1;
        } else if (nums[mid] < zero) {
            finish = mid - 1;
        }
    }
    return pivot;
}

const helper = (nums, start, finish, target) => {
    let res = -1;
    while (start <= finish) {
        const mid = Math.floor((start + finish) / 2);
        if (nums[mid] === target) {
            res = mid;
            break;
        } else if (nums[mid] > target) {
            finish = mid - 1;
        } else {
            start = mid + 1;
        }
    }
    return res;
};

const search = (nums, target) => {
    if (nums[0] === target) {
        return 0;
    }
    
    let find;
    const lastIndex = nums.length - 1;
    const pivot = (nums[0] > nums[lastIndex]) ? searchPivot(nums) : 0;
    if (pivot !== 0 && nums[0] < target) {
        find = helper(nums, 0, pivot-1, target);
    } else {
        find = helper(nums, pivot, nums.length-1, target);
    }
    return find;
};
