/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */
/**
 * @param {ListNode} l1
 * @param {ListNode} l2
 * @return {ListNode}
 */
var mergeTwoLists = function(l1, l2) {
    let newNode = new ListNode(0);
    let head = newNode;
    while(l1 && l2) {
        if(l1.val <= l2.val) {
            newNode.next = new ListNode(l1.val);
            l1 = l1.next;
        } else {
            newNode.next = new ListNode(l2.val);
            l2 = l2.next;
        }
        newNode = newNode.next;
    }
    if(l1) newNode.next = l1;
    if(l2) newNode.next = l2;
    return head.next;
};
