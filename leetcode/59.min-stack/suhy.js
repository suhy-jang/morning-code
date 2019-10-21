/**
 * initialize your data structure here.
 */
var MinStack = function() {
    this.arr = [];
};

/** 
 * @param {number} x
 * @return {void}
 */
MinStack.prototype.push = function(x) {
    this.arr.unshift(x);
};

/**
 * @return {void}
 */
MinStack.prototype.pop = function() {
    this.arr.shift();
};

/**
 * @return {number}
 */
MinStack.prototype.top = function() {
    return this.arr[0];
};

/**
 * @return {number}
 */
MinStack.prototype.getMin = function() {
    let min = this.arr[0];
    this.arr.forEach(e => {
        if (e < min) min = e;
    })
    return min
};

/** 
 * Your MinStack object will be instantiated and called as such:
 * var obj = new MinStack()
 * obj.push(x)
 * obj.pop()
 * var param_3 = obj.top()
 * var param_4 = obj.getMin()
 */
