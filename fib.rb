def recursive_fib n
	n > 1 ? recursive_fib(n - 1) + recursive_fib(n - 2) : n
end

def iterative_fib n
	a = 0
	b = 1

	while n > 0 do
		n -= 1

		t = a + b
		a = b
		b = t
	end

	a
end

require 'benchmark'
num = 35

Benchmark.bm do |x|
	x.report('recursive_fib') {recursive_fib(num)}
	x.report('iterative_fib') {iterative_fib(num)}
end