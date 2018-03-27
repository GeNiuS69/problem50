require 'prime'
LIMIT = 1_000_000

primes = []
Prime.each(LIMIT) { |prime| primes.push(prime) }

max_sum = 0
max_length = -1

(0...primes.length).each do |i|
  sum = 0
  (i...primes.length).each do |j|
    sum += primes[j]
    break if sum > LIMIT
    next unless Prime.prime?(sum) && sum > max_sum && j - i + 1 > max_length
    max_length = j - i + 1
    max_sum = sum
  end
end

puts max_sum
