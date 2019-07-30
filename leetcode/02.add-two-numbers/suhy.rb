# https://leetcode.com/problems/add-two-numbers/

# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
    sum_list = nil
    sum_list_head = nil
    remain = 0
    i = 0
    until l1.nil? && l2.nil? && remain.zero?
        sum = remain
        sum += l1.val unless l1.nil?
        sum += l2.val unless l2.nil?
        remain = sum / 10
        node = ListNode.new(sum % 10)
        if sum_list.nil?
            sum_list = node
            sum_list_head = node
        else
            sum_list.next = node
            sum_list = node
        end        
        l1 = l1.next unless l1.nil?
        l2 = l2.next unless l2.nil?
    end
    sum_list_head
end

# ex )
# l1 = list of [2,4,3]
# l2 = list of [5,6,4]
