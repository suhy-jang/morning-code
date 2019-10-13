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
    ListNode *getCommonStartPoint(ListNode *head, int size) {
        ListNode* node = head;
        for(int i=0; i < size; i++) {
            node = node->next;
        }
        return node;
    }
    ListNode *getIntersectionNode(ListNode *headA, ListNode *headB) {
        int countA = 0;
        int countB = 0;
        ListNode* node = headA;
        while(node) {
            countA++;
            node = node->next;
        }
        node = headB;
        while(node) {
            countB++;
            node = node->next;
        }
        ListNode* nodeA = headA;
        ListNode* nodeB = headB;
        if(countA <= countB) {
            nodeB = getCommonStartPoint(headB, countB - countA);
        } else {
            nodeA = getCommonStartPoint(headA, countA - countB);
        }
        node = NULL;
        while(nodeA != NULL) {
            if(nodeA == nodeB) {
                node = nodeA;
                break;
            }
            nodeA = nodeA->next;
            nodeB = nodeB->next;
        }
        return node;
    }
};
