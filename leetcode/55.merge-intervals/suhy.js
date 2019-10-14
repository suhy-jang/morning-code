/**
 * @param {number[][]} intervals
 * @return {number[][]}
 */
var merge = function(intervals) {
    let mergedIntervals = [];
    intervals = intervals.sort((first, second) => first[0] - second[0]);
    let i = 0;
    while (i < intervals.length) {
        while (i > 0 && i < intervals.length && intervals[i][0] <= intervals[i-1][1]) {
            intervals[i-1][1] = Math.max(intervals[i-1][1], intervals[i][1]);
            intervals.splice(i, 1);
        }
        i += 1;
    }
    return intervals;
};
