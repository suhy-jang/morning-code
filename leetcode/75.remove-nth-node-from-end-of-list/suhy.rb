# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
    goal = -n
    curr_link = head
    while curr_link
        goal += 1
        curr_link = curr_link.next
    end
    prev_link = nil
    curr_link = head
    while curr_link
        if goal.zero?
            next_link = curr_link.next
            if prev_link
                prev_link.next = next_link
            else
                head = next_link
            end
        end
        goal -= 1
        prev_link = curr_link
        curr_link = curr_link.next
    end
    head
end
