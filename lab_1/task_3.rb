#1
def min_element(arr)
  min = arr[0]
  for i in 1..arr.length-1
    if arr[i] < min
      min = arr[i]
    end
  end
  min
end


def first_positive_element(arr)
  i = 0
  while i < arr.length
    if arr[i] > 0
      return i
    end
    i += 1
  end
  return -1
end


#2
require_relative 'test'

method_name = ARGV[0]

file_name = ARGV[1]

numbers = []
File.open(file_name, "r") do |file|
  file.each_line do |line|
    numbers << line.to_i
  end
end

case method_name
when "min"
  puts min_element(numbers)
when "positive"
  puts first_positive_element(numbers)
else
  puts "Unknown method"
end

