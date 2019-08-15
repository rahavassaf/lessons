module BTreeSort
	def self.sort data
		tree = nil

		data.each{|v|
			if tree.nil?
				tree = Btree.new(v)
			else
				tree.insert(v)
			end
		}

		tree.nil? ? [] : tree.to_list
	end

	private

	class Btree
		attr_accessor :payload, :left, :right

		def initialize(payload, left = nil, right = nil)
			@payload = payload
			@left = left
			@right = right
		end

		def insert value
			if value < @payload
				if @left.nil?
					@left = Btree.new(value)
				else
					@left.insert(value)
				end
			else
				if @right.nil?
					@right = Btree.new(value)
				else
					@right.insert(value)
				end
			end
		end

		def to_list
			tmp = @left.nil? ? [] : @left.to_list
			tmp += [@payload]
			tmp += @right.to_list if ! @right.nil?
			tmp
		end
	end
end