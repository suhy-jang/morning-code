/**
 * @param {number[]} nums
 * @return {number}
 */
const findUnsortedSubarray = (nums) => {
    const sortedNums = nums.slice(0).sort((a, b) => a - b);
    let start = 0;
    let finish = nums.length - 1;
    while(start <= finish && nums[start] === sortedNums[start]) {
        start += 1;
    }
    while(start <= finish && nums[finish] === sortedNums[finish]) {
        finish -= 1;
    }
    return start > finish ? 0 : (finish - start + 1);
};
