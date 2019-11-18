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
const removeNthFromEnd = (head, n) => {
    if (head == null) return head;
    
    let goalNum = -n;
    let currLink = head;
    while (currLink != null) {
        goalNum += 1;
        currLink = currLink.next;
    }
    currLink = head;
    let prevLink;
    while (currLink != null) {
        if (goalNum == 0) {
            const nextLink = currLink.next;
            if (prevLink) {
                if (!nextLink) prevLink.next = null;
                else prevLink.next = nextLink;
            } else {
                head = nextLink;
            }
        }
        goalNum -= 1;
        prevLink = currLink;
        currLink = currLink.next;
    }
    return head;
};
