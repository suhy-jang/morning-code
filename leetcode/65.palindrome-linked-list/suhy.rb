# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {Boolean}
def is_palindrome(head)
    first_half = head
    second_half = head
    slow = head
    fast = head
    while !fast.nil? && !fast.next.nil?
        slow = slow.next
        fast = fast.next.next
    end
    if fast.nil?
        second_half = slow
    elsif fast.next.nil?
        second_half = slow.next
    end
    # reverse half
    curr = second_half
    prev = nil
    while !curr.nil?
        next_node = curr.next
        curr.next = prev
        prev = curr
        curr = next_node
    end
    second_half = prev
    while !second_half.nil?
        if first_half.val != second_half.val
            return false
        end
        first_half = first_half.next
        second_half = second_half.next
    end
    true
end
