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
    ListNode *detectCycle(ListNode *head) {
        set<ListNode*> nodesSeen;
        while (head != NULL) {
            if (nodesSeen.find(head) != nodesSeen.end()) {
                return head;
            } else {
                nodesSeen.insert(head);
            }
            head = head->next;
        }
        return NULL;
    }
};
