require 'set'

class LinkedList

    class ListNode
        attr_accessor :value, :next_node
        
        def initialize(value, next_node = nil)
            @value = value
            @next_node = next_node
        end
        
        def reverse(prev = nil)
            
            if @next_node.nil?
                @next_node = prev
                return self
            end
            
            new_head = @next_node.reverse(self)
            
            @next_node = prev
            
            return new_head
        end
    end
    
    attr_accessor :head # only to test infinite?, not really a good idea
    
    def initialize
        @head = nil
    end
    
    
    def push(value)
        @head = ListNode.new(value, @head)
    end
    
    
    def reverse
        if ! @head.nil?
            @head = @head.reverse(nil)
        end
    end
    
    
    def infinite?
        s = Set.new()
        
        curr = @head
        
        while ! curr.nil?
            if s.include?(curr)
                return true
            end
            
            s << curr
            curr = curr.next_node
        end
        
        return false
    end
    
    
    def to_s
        a = []
        
        curr = @head
        
        while ! curr.nil?
            a << curr.value
            curr = curr.next_node
        end
        
        puts a.join(" => ")
    end
end



l = LinkedList.new()
l.push(5)
l.push(8)
l.push(15)
l.push(4)
l.push(745)
l.push(152)
l.push(85)
l.push(72)
l.push(36)
puts l.to_s
l.reverse()
puts l.to_s


puts l.infinite? # false


# loop the tail back to the head
l.head.next_node.next_node.next_node.next_node.next_node.next_node.next_node.next_node = l.head


puts l.infinite? # true

