/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */

/**
 * @param {ListNode} head
 * @return {ListNode}
 */
var detectCycle = function(head) {
    const nodesSeen = new Set([]);
    while (head != null) {
        if (nodesSeen.has(head)) {
            return head;
        } else {
            nodesSeen.add(head);
        }
        head = head.next;
    }
    return null;
};
