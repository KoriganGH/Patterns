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


#3
def is_coprime(a, b)
  (2..[a, b].min).none? { |i| a % i == 0 && b % i == 0 }
end

def is_prime_digit(digit)
  [2, 3, 5, 7].include?(digit)
end

def sum_of_prime_digits(n)
  sum = 0
  while n > 0
    digit = n % 10
    if is_prime_digit(digit)
      sum += digit
    end
    n /= 10
  end
  sum
end

def count_numbers(n)
  prime_digits_sum = sum_of_prime_digits(n)
  count = 0
  (1..n-1).each do |i|
    if n % i != 0 && !is_coprime(i, n) && is_coprime(i, prime_digits_sum)
      count += 1
    end
  end
  count
end
