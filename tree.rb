class MyQueue
  def initialize
    @queue = []
  end

  def enqueue(item)
    @queue.push(item)
  end

  def dequeue
    @queue.shift
  end

  def empty?
  	@queue.length == 0
  end
end



class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end

  def find_dfs val
  	puts @payload

  	if @payload == val
  		return self
  	end

  	@children.each {|c|
  		tmp = c.find_dfs val

  		
		return tmp if ! tmp.nil?
  	}

  	return nil
  end


  def find_bfs val
  	queue = MyQueue.new

  	queue.enqueue(self)


  	while !queue.empty?
  		q = queue.dequeue

  		puts q.payload
  		
		return q if q.payload == val

  		q.children.each {|c|
  			queue.enqueue(c)
  		}
  	end

  	return nil
  end
end


# The "Leafs" of a tree, elements that have no children
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk   = Tree.new(2, [seventh_node, shallow_fifth_node])

puts trunk.find_dfs(11)
puts trunk.find_bfs(11)