def collatz n
	a = []

	while n != 1 do
		a << n

		n = n % 2 == 0 ? n / 2 : 3 * n + 1
	end

	a << 1

	a
end


max_n = max_l = 0

(1..1000000).each {|i|
	t = collatz i

	if t.length > max_l
		max_l = t.length
		max_n = i
	end
}

puts max_n
