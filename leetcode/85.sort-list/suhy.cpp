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
    ListNode* mergeSort(ListNode* h1, ListNode* h2) {
        ListNode* head = new ListNode(-1);
        ListNode* savedHead = head;
        while (h1 != NULL && h2 != NULL) {
            if (h1->val < h2->val) {
                head->next = h1;
                h1 = h1->next;
            } else {
                head->next = h2;
                h2 = h2->next;
            }
            head = head->next;
        }
        head->next = (h2 == NULL) ? h1 : h2;
        return savedHead->next;
    }
    
    ListNode* sortList(ListNode* head) {
        if (head == NULL || head->next == NULL) return head;
        ListNode* slow = head;
        ListNode* fast = head;
        while(fast->next != NULL && fast->next->next != NULL) {
            slow = slow->next;
            fast = fast->next->next;
        }
        ListNode* mid = slow->next;
        slow->next = NULL;
        return mergeSort(sortList(head), sortList(mid));
    }
};
