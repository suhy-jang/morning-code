/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */
/**
 * @param {ListNode[]} lists
 * @return {ListNode}
 */
var mergeKLists = function(lists) {
    let res = null;
    let head = null;
    let location = new Set();
    for(let i = 0; i < lists.length; i++) {
        if(lists[i]) {
            location.add(i);
        }
    }
    while(location.size > 0) {
        let minVal = 9007199254740992;
        let minIndex = 0;
        location.forEach((i) => {
            if(lists[i] && minVal > lists[i].val) {
                minVal = lists[i].val;
                minIndex = i;
            }
        });
        let newNode = new ListNode(minVal);
        if(res) res.next = newNode;
        res = newNode;
        if(!head) head = res;
        lists[minIndex] = lists[minIndex].next;
        if(!lists[minIndex]) location.delete(minIndex);
     }
    return head;
};
