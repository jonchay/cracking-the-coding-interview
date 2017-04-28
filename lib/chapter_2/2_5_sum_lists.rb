# 2.5 Sum Lists
# You have two numbers represented by a linked list, where each node contains a
#   single digit. The digits are stored in reverse order, such that the 1's
#   digit is at the head of the list. Write a function that adds the two numbers
#   and returns the sum as a linked list.
#
# Discussion:
#   When the values are stored in reverse, this problem can be solved
#   iteratively by storing the carry value as it goes.
#
# Time complexity: O([node1.length, node2.length].max) since it will iterate
#   until the last value of the longest list
# Space complexity: The total will have a number of nodes equal to number of
#   digits in the sum of the arguments.
#
def sum_lists(node1, node2)
  result = LinkedList.new
  carry = 0

  until node1.nil? && node2.nil?
    digit1, digit2 = ((!node1.nil? && node1.data) || 0), ((!node2.nil? && node2.data) || 0)

    sum_digits = digit1 + digit2 + carry
    result.append(sum_digits % 10)

    carry = sum_digits / 10
    node1 = node1.next
    node2 = node2.next
  end
  result.append(carry) if carry != 0

  result
end

# When the values are stored in forward order, several additional challenges
#   arise:
#     1. The digits in each argument are no longer aligned
#     2. The carry value cannot be passed forward
#   To address these issues, we can pad the shorter value with zeros, then use
#   recursion to pass the carry value backwards.
#
def sum_lists_forward(node1, node2)
  node1, node2 = normalize_nodes(node1, node2)

  recursive_add(node1, node2)
end

def normalize_nodes(node1, node2)
  length1 = node1.to_a.length
  length2 = node2.to_a.length
  max_length = [length1, length2].max

  [
    pad_list(node1, max_length - length1),
    pad_list(node2, max_length - length2)
  ]
end

def recursive_add(node1, node2)
  return node1 if node2.to_a.uniq == [0]

  result = LinkedList.new
  carry = LinkedList.new

  until node1.nil? && node2.nil?
    sum = node1.data + node2.data
    result.append(sum % 10)
    carry.append(sum / 10)

    node1 = node1.next
    node2 = node2.next
  end

  pointer = carry.head
  until pointer.nil?
    if pointer.next.nil?
      pointer.next = LinkedList::Node.new(0)
      break
    end
    pointer = pointer.next
  end

  carry.head = carry.head.next
  recursive_add(result.head, carry.head)
end

def pad_list(node, pad_amount)
  return node if pad_amount.zero?

  until pad_amount.zero?
    zero_node = LinkedList::Node.new(0)
    zero_node.next = node
    node = zero_node

    pad_amount -= 1
  end
  node
end
