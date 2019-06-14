class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end


class Stack
    
    attr_reader :data

    def initialize
        @data = nil
    end

    # Push a value onto the stack
    def push(value)
        @data = LinkedListNode.new(value, @data)
    end

    # Pop an item off the stack.
    # Remove the last item that was pushed onto the
    # stack and return the value to the user
    def pop
        
        if @data
            value = @data.value
            @data = @data.next_node
        else
            value = nil
        end
        
        value
    end
    
    def reverse
        # ADD CODE HERE
        tmp = Stack.new
        list = @data
        
        while list
            # ADD CODE HERE
            tmp.push(list.value)
            list = list.next_node
        end
        
        # ADD CODE HERE
        @data = tmp.data
    end
    
    def to_s
        vals = []
        
        curr = @data
        
        while ! curr.nil?
            vals << curr.value
            curr = curr.next_node
        end
        
        return vals.join(" -> ")
    end
end




s = Stack.new

[1, 2, 3, 4, 5, 6, 7, 8, 9].each{|i| s.push(i)}


puts "original"

puts s

puts "reversed"

s.reverse

puts s
