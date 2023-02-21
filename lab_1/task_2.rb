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
