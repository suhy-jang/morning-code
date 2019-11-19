/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */
/**
 * @param {ListNode} head
 * @param {number} n
 * @return {ListNode}
 */
// iterative way
const reverseList = (head) => {
    if (head == null || head.next == null) return head;
    
    let prevNode = null
    while (head) {
        const nextNode = head.next
        head.next = prevNode
        
        prevNode = head
        head = nextNode
    }
    return prevNode
};
// recursive way
const reverseList = (head) => {
    if (head === null || head.next == null) return head;
    p = reverseList(head.next);
    head.next.next = head;
    head.next = null;
    return p;
};
