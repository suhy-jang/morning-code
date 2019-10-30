/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
class Solution {
public:
    bool isPalindrome(ListNode* head) {
        bool isPalindrome = true;
        ListNode* first_half = head;
        ListNode* second_half = head;
        ListNode* slow = head;
        ListNode* fast = head;
        while (fast != NULL && fast->next != NULL) {
            slow = slow->next;
            fast = fast->next->next;
        }
        if (fast == NULL) {
            second_half = slow;
        } else if (fast->next == NULL) {
            second_half = slow->next;
        }
        ListNode* curr = second_half;
        ListNode* prev = NULL;
        while (curr != NULL) {
            ListNode* nextNode = curr->next;
            curr->next = prev;
            prev = curr;
            curr = nextNode;
        }
        second_half = prev;
        while (second_half) {
            if (first_half->val != second_half->val) {
                isPalindrome = false;
            }
            first_half = first_half->next;
            second_half = second_half->next;
        }
        return isPalindrome;
    }
};
