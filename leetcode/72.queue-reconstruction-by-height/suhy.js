/**
 * @param {number[][]} people
 * @return {number[][]}
 */
const reconstructQueue = (people) => {
    people.sort((a, b) => (a[0] == b[0] ? a[1] - b[1] : b[0] - a[0]));
    const res = [];
    people.forEach(p => res.splice(p[1], 0, p));
    return res;
};
