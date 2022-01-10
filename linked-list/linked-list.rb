class Node
  
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

end

class LinkedList

  attr_accessor :head

  def initialize()
    @head = Node.new()
  end

  public
  def append(value)
    new_node = Node.new()
    new_node.value = value


    next_node = @head.next_node
    next_node_is_nil = next_node.nil?

    if (@head.value.nil?) then
      @head = new_node
      return
    end

    if (next_node_is_nil) then
      @head.next_node = new_node
      return
    end

    until next_node_is_nil do
      current_node = next_node
      next_node = next_node.next_node
      next_node_is_nil = next_node.nil?
    end 

    current_node.next_node = new_node

  end

  def prepend(value) 

    if (@head.value.nil?) then
     @head.value = value
     return
    end 

    current_head = @head
    new_head = Node.new()
    new_head.value = value
    new_head.next_node = current_head
    @head = new_head

  end

  def to_s
    return_string = @head ? "( #{@head.value} ) -> " : "( nil ) " 
    
    if (@head.nil?) then
      return return_string
    end
    
    next_node = @head.next_node

    next_node_is_nil = next_node.nil?

    if (next_node_is_nil) then
      return return_string.concat("nil\n")
    end

    until next_node_is_nil do
      return_string.concat("( #{next_node.value} ) -> ")
      next_node = next_node.next_node
      next_node_is_nil = next_node.nil?
    end

    return return_string.concat("nil\n")

  end

  def size
    
    counter = 0

    if (!@head.value.nil?) then
      counter += 1
    end

    next_node = @head.next_node

    until next_node.nil? do
      counter += 1
      next_node = next_node.next_node
    end

    return counter

  end

  def tail
    if(@head.value.nil?) then
      return "nil"
    end
    if(@head.next_node.nil?) then
      return @head
    end

    next_node = @head.next_node

    until next_node.next_node.nil? do
      next_node = next_node.next_node
    end

    return next_node

  end

  def at(index)
    
    if (index > self.size - 1) then
      return "nil"
    end

    counter = index

    next_node = @head

    while counter > 0 do
      next_node = next_node.next_node
      counter -= 1
    end

    return next_node

  end

  def pop
    
    if (self.size == 1) then
      @head = nil
      return
    end

    if (self.size == 0) then
      return "nil"
    end

    second_last_element = self.at(self.size - 2)
    second_last_element.next_node = nil

  end

  def contains?(value)

    next_node = @head

    until next_node.nil? do
      return true if next_node.value.include?(value)
      next_node = next_node.next_node
    end

    return false

  end

  def find(value)

    counter = 0
    next_node = @head

    until next_node.nil? do

      if(next_node.value.include?(value))
        return counter
      end

      counter += 1
      next_node = next_node.next_node

    end

    return "nil"

  end

end

test_list = LinkedList.new()
test_list.append("first value")
test_list.append("second value")
test_list.append("third value")

puts
print "size: #{test_list.size}"
puts
print test_list.to_s
puts

test_list.prepend("before first value")
test_list.prepend("before first first value")
print "size: #{test_list.size}"
puts
print test_list.to_s
puts

print "head: #{test_list.head.value}"
puts
print "tail: #{test_list.tail.value}"
puts
print "the nth element is #{test_list.at(5)}"
puts

test_list.pop()
puts
print test_list.to_s
puts
print test_list.contains?("first")
puts
print test_list.find("third")
puts