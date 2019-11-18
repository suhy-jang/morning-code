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
    ListNode* removeNthFromEnd(ListNode* head, int n) {
        if (head == NULL) return head;
        
        ListNode* currNode = head;
        int goal = -n;
        while (currNode) {
            goal++;
            currNode = currNode->next;
        }
        ListNode* prevNode = NULL;
        currNode = head;
        while (currNode != NULL) {
            ListNode* nextNode = currNode->next;
            if (goal == 0) {
                if (prevNode) {
                    prevNode->next = nextNode;
                } else {
                    head = nextNode;
                }
            }
            goal--;
            prevNode = currNode;
            currNode = currNode->next;
        }
        return head;
    }
};
