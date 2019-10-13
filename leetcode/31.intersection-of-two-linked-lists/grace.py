# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution(object):
    def getIntersectionNode(self, headA, headB):
        """
        :type head1, head1: ListNode
        :rtype: ListNode
        """
        if headA == None or headB == None:
            return None
        x, y = headA, headB
        while x!=y:
            if x == None:
                x = headB
            else:
                x = x.next

            if y == None:
                y = headA
            else:
                y = y.next
        return x
            
