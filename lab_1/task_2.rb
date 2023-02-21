#1
def is_prime(n)
  return false if n < 2
  (2..n-1).none? { |i| n % i == 0 }
end

def sum_of_non_prime_divisors(n)
  sum = 0
  (2..n/2).each do |i|
    if n % i == 0 && !is_prime(i)
      sum += i
    end
  end
  sum
end


#2
def count_digits_less_than_3(n)
  count = 0
  while n > 0
    digit = n % 10
    if digit < 3
      count += 1
    end
    n /= 10
  end
  count
end
