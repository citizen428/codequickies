// generates the nth Fibonacci number
Number phi := (1 + 5 sqrt) / 2
Number fib := method(
  (phi**self/5 sqrt) round
)

// testing
list(0,1,5,10,20) foreach(fib println)
