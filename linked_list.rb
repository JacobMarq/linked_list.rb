require_relative "node.rb"

class LinkedList
  attr_accessor :name
  attr_reader :head, :tail
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    node = Node.new(value)
    node.next_node = nil
    
    @tail.next_node = node if @tail != nil
    @tail = node
    
    @head = node if @head === nil
  end

  def prepend(value)
    node = Node.new(value)
    node.next_node = @head
    
    @head = node
    @tail = node if @tail === nil
  end

  def size
    count = 0
    return count if @head === nil
    node = @head

    while node != nil
      count += 1
      node = node.next_node
    end
    return count
  end
  
  def at(index)
    node = @head
    
    for i in 0...index
      return node if node === nil
      node = node.next_node
    end
    
    return node
  end
  
  def pop
    node = @head
    return if @head === nil
    
    for i in 0...(size - 2)
      node = node.next_node
    end
    
    node.next_node = nil
    @tail = node
  end
  
  def contains?(value)
    node = @head
    return false if node === nil 
    
    for i in 0...size
      return true if node.value == value
      node = node.next_node
    end
    
    return false
  end
  
  def find(value)
    node = @head
    return nil if node === nil 
    
    for i in 0...size
      return i if node.value == value
      node = node.next_node
    end
    
    return nil
  end
  
  def to_s
    node = @head
    str = ""
    
    for i in 0...size
      str << "(#{node.value}) -> "
      str << "nil" if node.next_node === nil
      node = node.next_node
    end
    
    return str
  end
  
  def insert_at(value, index)
    current_node = at(index)
    previous_node = at(index - 1)
    
    new_node = Node.new(value)
    new_node.next_node = current_node
    previous_node.next_node = new_node unless previous_node === nil
  end
  
  def remove_at(index)
    node = at(index)
    return if node == nil
    
    previous_node = at(index - 1)
    
    previous_node.next_node = node.next_node
  end
end
