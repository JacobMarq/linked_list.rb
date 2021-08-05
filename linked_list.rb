require_relative "node.rb"
include Enumerable

class LinkedList
  attr_accessor :head, :tail, :name
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    node = Node.new(value)
    node.next_node = nil
    
    @tail.next_node = node if @tail != nil
    @tail = node
    
    @head = node if @head.nil?
  end

  def prepend(value)
    node = Node.new(value)
    node.next_node = @head
    
    @head = node
    @tail = node if @tail.nil?
  end

  def size
    return nil if @head.nil?
    
    count = 0
    node = @head

    until node.nil?
      count += 1
      node = node.next_node
    end
    return count
  end
  
  def at(index)
    return nil if @head.nil?
    
    node = @head
    
    for i in 0...index
      return node if node.nil?
      node = node.next_node
    end
    
    return node
  end
  
  def pop
    return if @head.nil?
    
    node = @head
    
    for i in 0...(size - 2)
      node = node.next_node
    end
    
    node.next_node = nil
    @tail = node
  end
  
  def contains?(value)
    return false if @head.nil?
    
    node = @head
    
    for i in 0...size
      return true if node.value == value
      node = node.next_node
    end
    
    return false
  end
  
  def find(value)
    return nil if @head.nil? 
    
    node = @head
    
    for i in 0...size
      return i if node.value == value
      node = node.next_node
    end
    
    return nil
  end
  
  def to_s
    return nil if @head.nil?
    
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
    return nil if @head.nil?
    
    current_node = at(index)
    previous_node = at(index - 1)
    
    new_node = Node.new(value)
    new_node.next_node = current_node
    previous_node.next_node = new_node unless previous_node === nil
  end
  
  def remove_at(index)
    node = at(index)
    return nil if node.nil?
    
    previous_node = at(index - 1)
    
    previous_node.next_node = node.next_node
  end
  
  def reverse!
    return if @head.nil?
    
    node = @head
    @head = @head.next_node
    node.next_node = nil
    @tail = node
    prev = @tail
    
    until @head.nil?
      node = @head
      @head = @head.next_node
      node.next_node = prev
      prev = node
    end
    
    @head = prev
  end
  
  def each
    return nil if @head.nil?
    
    input = @head
    until input.nil?
      yield input
      input = input.next_node
    end
  end
  
  def reverse
    return nil if @head.nil?
    
    new_list = LinkedList.new
    self.each { |i| new_list.append(i.value) }
    return new_list
  end
end
