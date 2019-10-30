/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */
/**
 * @param {ListNode} head
 * @return {boolean}
 */
let isPalindrome = function(head) {
    let isPalindrome = true;
    let firstHalf = head;
    let secondHalf = null;
    let slow = head;
    let fast = head;
    while(fast && fast.next) {
        slow = slow.next;
        fast = fast.next.next;
    }
    if (!fast) {
        secondHalf = slow;
    } else if (!fast.next) {
        secondHalf = slow.next;
    }
    let curr = secondHalf;
    let prev = null;
    while(curr) {
        const nextNode = curr.next;
        curr.next = prev;
        prev = curr;
        curr = nextNode;
    }
    secondHalf = prev;
    while (secondHalf) {
        if (firstHalf.val != secondHalf.val) {
            isPalindrome = false;
        }
        firstHalf = firstHalf.next;
        secondHalf = secondHalf.next;
    }
    return isPalindrome;
};
