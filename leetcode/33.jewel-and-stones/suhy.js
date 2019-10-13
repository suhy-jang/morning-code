/**
 * @param {string} J
 * @param {string} S
 * @return {number}
 */
var numJewelsInStones = function(J, S) {
    jewels = J.split("");
    stones = S.split("");
    let count = 0;
    jewels.forEach((j) => {
        count += stones.filter((s) => s == j).length;
    })
    return count;
};
